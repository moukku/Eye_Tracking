/*
** Mikko Koponen 2016
** Eye Tracking course project.
** The program finds eye fixations from time series data in csv format.
** Input csv file's fields are supposed to be: sid, known, and alternating x and y values for samples.
** The program saves the centroids (calculated from point averages) and fixation times in a csv file.
** The output file is structured almost the same as the source file, except for a sample count (time) value
** added after the x and y values for each point.
 */

package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"math"
	"os"
	"strconv"
	"strings"
)

//Reads data from csv file.
//Didn't use the csv library because it didn't like uneven numbers of fields or something.
func readLines(filename string) [][]string {
	log.Println("Reading data from", filename, "...")
	file, err := os.Open(filename)
	defer file.Close()
	if err != nil {
		log.Fatal(err)
	}
	r := bufio.NewReader(file)
	lines := make([][]string, 0)
	for {
		rawLine, err := r.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				break
			}
			log.Fatal(err)
		}
		line := strings.Split(rawLine, ",")
		for i, _ := range line {
			line[i] = strings.Trim(line[i], "\n")
		}
		lines = append(lines, line)
	}
	log.Println("Data read from", filename)
	return lines
}

//Writes the data to a file
func writeLines(lines []string, savefilename string) {
	log.Println("Writing results to file", savefilename, "...")
	file, err := os.OpenFile(savefilename, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, 0666)
	if err != nil {
		log.Fatal(err)
	}
	for _, line := range lines {
		_, err := file.WriteString(line)
		if err != nil {
			log.Fatal(err)
		}
	}
	log.Println("Wrote results to", savefilename, ", quitting...")
	defer file.Close()
}

//Finds fixations from a time series using the I-VT algorithm. Returns a n*3 array of fixation centroid's
//x and y coordinates and the fixation's duration (number of samples in a fixation)
func findFixations(line []string, threshold float64) [][3]float64 {
	log.Println("Finding fixations and saccades for subject", line[0], "...")
	intermediaryFixations := make([][][2]float64, 1)
	var intermediaryFixationsCount int
	var fixationIndex int
	var inSaccade bool = false
	//i := 2 for the fields before the time series data
	for i := 2; i < len(line)-3; i += 2 {
		x1, err := strconv.ParseFloat(line[i], 32)
		y1, err := strconv.ParseFloat(line[i+1], 32)
		x2, err := strconv.ParseFloat(line[i+2], 32)
		y2, err := strconv.ParseFloat(line[i+3], 32)
		if err != nil {
			log.Println("Error parsing data:", err)
		}
		if velocity(x1, y1, x2, y2) < threshold {
			inSaccade = false
			//dynamically initialize more slices
			if len(intermediaryFixations) < fixationIndex+1 {
				intermediaryFixations = append(intermediaryFixations, make([][2]float64, 0))
			}
			intermediaryFixations[fixationIndex] = append(intermediaryFixations[fixationIndex],
				[2]float64{x2, y2})
			intermediaryFixationsCount++
		} else {
			if !inSaccade {
				fixationIndex++
				inSaccade = true
			}
		}
	}
	if intermediaryFixationsCount != 0 {
		log.Println("Found fixations in", (float32(intermediaryFixationsCount)/float32(len(line)-2))*100*2, "% of the samples")
	}
	return findCentroids(intermediaryFixations)
}

//Simply calculates an average from the points, nothing fancy.
//Also calculates the number of samples in each fixation, which can be used to calculate the time.
func findCentroids(fixations [][][2]float64) (centroids [][3]float64) {
	for _, fixation := range fixations {
		var pointCount int
		var xAdd float64
		var yAdd float64
		for _, point := range fixation {
			xAdd += point[0]
			yAdd += point[1]
			pointCount++
		}
		centroids = append(centroids, [3]float64{xAdd / float64(pointCount), yAdd / float64(pointCount), float64(pointCount)})
	}
	return
}

//Calculates the distance (==velocity, the sampling rate being constant) between two points
func velocity(x1, y1, x2, y2 float64) float64 {
	return math.Sqrt(math.Pow((x1-x2), 2) + math.Pow((y1-y2), 2))
}

func main() {
	if len(os.Args) != 3 {
		log.Fatal("Usage: ivt_fixations [source file] [detection threshold]")
	}
	filename := os.Args[1]
	threshold, err := strconv.ParseFloat(os.Args[2], 64)
	if err != nil {
		log.Fatal(err)
	}
	savefilename := fmt.Sprint(strings.Split(filename, ".")[0], "_fixations.csv")
	lines := readLines(filename)
	centroidLines := make([]string, len(lines))
	for i, line := range lines {
		points := findFixations(line, threshold)
		var pointString string
		for _, point := range points {
			pointString = fmt.Sprint(pointString, ",", strconv.FormatFloat(point[0], 'f', 3, 64), ",",
				strconv.FormatFloat(point[1], 'f', 3, 64), ",", point[2])
		}
		centroidLines[i] = fmt.Sprint(line[0], ",", line[1], pointString, "\n")
	}
	writeLines(centroidLines, savefilename)
}

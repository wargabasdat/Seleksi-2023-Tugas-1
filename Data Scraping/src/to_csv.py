import csv
import json
import os


if __name__ == "__main__":
    # Get the base directory path
    base_path = os.path.dirname(os.path.abspath(__file__))

    # Input folder containing JSON files
    json_folder = os.path.join(base_path, "..", "data")

    # Output folder for CSV files
    csv_folder = os.path.join(base_path, "..", "data", "csv")

    # Iterate through JSON files in the input folder
    for filename in os.listdir(json_folder):
        if filename.endswith(".json"):
            # JSON file path
            json_file = os.path.join(json_folder, filename)

            # CSV file path
            csv_file = os.path.join(csv_folder, f"{os.path.splitext(filename)[0]}.csv")

            # Parse JSON data
            with open(json_file) as infile:
                data = json.load(infile)[filename[:-5]]

            # Extract header from the first JSON object
            header = data[0].keys()

            # Convert JSON to CSV
            with open(csv_file, "w", newline="") as outfile:
                writer = csv.DictWriter(outfile, fieldnames=header)
                writer.writeheader()
                writer.writerows(data)

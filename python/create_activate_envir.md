# Create and activate a Python environment on an HPC

```
# Load the desired Python module (adjust version as needed)
module load python/3.11

# Create a new virtual environment in your home or project directory
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Upgrade pip inside the virtual environment
pip install --upgrade pip

# Now you can install Python packages
pip install numpy pandas matplotlib
```


import numpy as np

data = np.random.normal(12.0, 3.5, 10_000)
print("Nb data:", len(data))
print("Mean:", data.mean())
print("Std:", data.std())
print("Extract:", data[:5])

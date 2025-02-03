/*
1. Memory:
Temporary storage: It’s used for temporary variables and is erased between (or at the end of) function calls.
Faster: Memory is much faster than storage.
Cheaper to use: Interacting with memory is cheaper in terms of gas costs compared to storage.
Volatile: Data stored in memory is not persistent between transactions.
2. Storage:
Persistent storage: It’s used to store data permanently on the blockchain. This data stays even after the function execution completes.
Slower: Writing to storage is much slower than writing to memory.
Expensive: Writing to storage costs more gas than using memory.
Persistent: Data stored in storage is persistent across transactions and is part of the contract's state.
*/
class TreeNode:
    """Node untuk General Tree"""

    def __init__(self, data):
        self.data = data
        self.children = []  # List of children nodes

    def add_child(self, child_node):
        self.children.append(child_node)
        print(f"Menambahkan {child_node.data} sebagai child dari {self.data}")

    def __str__(self):
        return self.data if isinstance(self.data, str) else str(self.data)


class GeneralTree:
    """Implementasi General Tree"""

    def __init__(self, root_data):
        self.root = TreeNode(root_data)
        print(f"Tree dibuat dengan root: {root_data}")

    def display(self, node=None, level=0):
        """Menampilkan tree secara hierarkis"""

        if node is None:
            node = self.root

        print("    " * level + f"├─ {node.data}")

        for child in node.children:
            self.display(child, level + 1)

    def dfs_traversal(self, node=None, visited=None):
        """Depth First Search traversal"""

        if visited is None:
            visited = []

        if node is None:
            node = self.root

        visited.append(node.data)

        for child in node.children:
            self.dfs_traversal(child, visited)

        return visited


# ==========================================
# MEMBUAT TREE ORGANISASI
# ==========================================

tree = GeneralTree("CEO")

finance = TreeNode("Finance")
it = TreeNode("IT")
hr = TreeNode("HR")

# Menambahkan child ke root
tree.root.add_child(finance)
tree.root.add_child(it)
tree.root.add_child(hr)

# Menambahkan child ke Finance
finance.add_child(TreeNode("Accounting"))
finance.add_child(TreeNode("Treasury"))

# Menambahkan child ke IT
it.add_child(TreeNode("Software Dev"))
it.add_child(TreeNode("Infrastructure"))

# ==========================================
# MENAMPILKAN TREE
# ==========================================

print("\nStruktur Tree:")
tree.display()

# DFS Traversal
print(f"\nDFS Traversal: {tree.dfs_traversal()}")
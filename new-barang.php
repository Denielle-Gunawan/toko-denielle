<!DOCTYPE html>
<html>

<head>
    <title>New Barang</title>
    <link rel="stylesheet" href="new-barang.css">
</head>

<body>
    <?php include "menu.php"; ?>

    <?php
    if ($_SESSION["level"] != "admin" && $_SESSION["level"] != "logistik") {
        echo "Anda tidak dapat mengakses halaman ini";
        exit;
    }
    ?>

    <div>
        <form action="create-barang.php" method="POST">
            <h1>Tambah Barang</h1>
            <table border="1px">
                <tr>
                    <td>Nama</td>
                    <td><input type="text" name="nama"></td>
                </tr>
                <tr>
                    <td>genre</td>
                    <td>
                        <select name="genre">
                            <option value="action">action</option>
                            <option value="fighting">fighting</option>
                            <option value="shooting">shooting</option>
                            <option value="sport">sport</option>
                            <option value="racing">racing</option>
                            <option value="strategy">strategy</option>
                            <option value="rpg">rpg</option>
                            <option value="adventure">adventure</option>
                            <option value="simulation">simulation</option>
                            <option value="multiplayer">multiplayer</option>
                            <option value="horror">horror</option>
                            <option value="horror">survival</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Stok</td>
                    <td><input type="number" min="0" name="stok"></td>
                </tr>
                <tr>
                    <td>Harga Beli</td>
                    <td><input type="number" min="0" name="harga_beli"></td>
                </tr>
                <tr>
                    <td>Harga Jual</td>
                    <td><input type="number" min="0" name="harga_jual"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">SIMPAN</button>
                        <button type="reset">RESET</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>
.class public Ls/h/e/l/l/S;
.super Landroid/app/Application;


# static fields
.field public static m:Z

.field public static n:Landroid/app/Application;

.field public static p:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v1, 0x0

    sput-object v1, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    sput-object v1, Ls/h/e/l/l/S;->n:Landroid/app/Application;

    const/4 v0, 0x0

    sput-boolean v0, Ls/h/e/l/l/S;->m:Z

    const/4 v3, 0x0

    :try_start_9
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_1e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2d

    :try_start_e
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_13} :catch_49
    .catchall {:try_start_e .. :try_end_13} :catchall_44

    if-eqz v0, :cond_18

    :try_start_15
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_40

    :cond_18
    :goto_18
    if-eqz v2, :cond_1d

    :try_start_1a
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1d} :catch_42

    :cond_1d
    :goto_1d
    return-void

    :catch_1e
    move-exception v0

    move-object v0, v1

    :goto_20
    if-eqz v0, :cond_25

    :try_start_22
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_3a

    :cond_25
    :goto_25
    if-eqz v1, :cond_1d

    :try_start_27
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2a} :catch_2b

    goto :goto_1d

    :catch_2b
    move-exception v0

    goto :goto_1d

    :catchall_2d
    move-exception v0

    move-object v2, v1

    :goto_2f
    if-eqz v2, :cond_34

    :try_start_31
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_3c

    :cond_34
    :goto_34
    if-eqz v1, :cond_39

    :try_start_36
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_39} :catch_3e

    :cond_39
    :goto_39
    throw v0

    :catch_3a
    move-exception v0

    goto :goto_25

    :catch_3c
    move-exception v2

    goto :goto_34

    :catch_3e
    move-exception v1

    goto :goto_39

    :catch_40
    move-exception v0

    goto :goto_18

    :catch_42
    move-exception v0

    goto :goto_1d

    :catchall_44
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_2f

    :catch_49
    move-exception v2

    goto :goto_20
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private c(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/io/File;)V
    .registers 10

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_42
    .catchall {:try_start_2 .. :try_end_7} :catchall_51

    :try_start_7
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_77
    .catchall {:try_start_7 .. :try_end_c} :catchall_72

    if-eqz v0, :cond_11

    :try_start_e
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_6e

    :cond_11
    :goto_11
    if-eqz v2, :cond_16

    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_70

    :cond_16
    :goto_16
    :try_start_16
    invoke-virtual {p3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {p3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_27
    invoke-virtual {p1, p2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v2, 0x400

    new-array v2, v2, [B

    :goto_34
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_5e

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_41} :catch_63

    :goto_41
    return-void

    :catch_42
    move-exception v0

    move-object v0, v1

    :goto_44
    if-eqz v0, :cond_49

    :try_start_46
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_49} :catch_68

    :cond_49
    :goto_49
    if-eqz v1, :cond_16

    :try_start_4b
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4e} :catch_4f

    goto :goto_16

    :catch_4f
    move-exception v0

    goto :goto_16

    :catchall_51
    move-exception v0

    move-object v2, v1

    :goto_53
    if-eqz v2, :cond_58

    :try_start_55
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_58} :catch_6a

    :cond_58
    :goto_58
    if-eqz v1, :cond_5d

    :try_start_5a
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_5d} :catch_6c

    :cond_5d
    :goto_5d
    throw v0

    :cond_5e
    const/4 v4, 0x0

    :try_start_5f
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_5f .. :try_end_62} :catch_63

    goto :goto_34

    :catch_63
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_41

    :catch_68
    move-exception v0

    goto :goto_49

    :catch_6a
    move-exception v2

    goto :goto_58

    :catch_6c
    move-exception v1

    goto :goto_5d

    :catch_6e
    move-exception v0

    goto :goto_11

    :catch_70
    move-exception v0

    goto :goto_16

    :catchall_72
    move-exception v2

    move-object v5, v2

    move-object v2, v0

    move-object v0, v5

    goto :goto_53

    :catch_77
    move-exception v2

    goto :goto_44
.end method

.method public static g(Ljava/io/File;)J
    .registers 9

    const-wide/16 v0, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_4
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_1f
    .catchall {:try_start_4 .. :try_end_9} :catchall_2e

    :try_start_9
    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_a2
    .catchall {:try_start_9 .. :try_end_e} :catchall_a0

    if-eqz v2, :cond_13

    :try_start_10
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_13} :catch_88

    :cond_13
    :goto_13
    if-eqz v5, :cond_18

    :try_start_15
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_8a

    :cond_18
    :goto_18
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_3b

    :cond_1e
    :goto_1e
    return-wide v0

    :catch_1f
    move-exception v2

    move-object v2, v3

    :goto_21
    if-eqz v2, :cond_26

    :try_start_23
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_26} :catch_82

    :cond_26
    :goto_26
    if-eqz v3, :cond_18

    :try_start_28
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_2c

    goto :goto_18

    :catch_2c
    move-exception v2

    goto :goto_18

    :catchall_2e
    move-exception v0

    move-object v2, v3

    :goto_30
    if-eqz v2, :cond_35

    :try_start_32
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_84

    :cond_35
    :goto_35
    if-eqz v3, :cond_3a

    :try_start_37
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_3a} :catch_86

    :cond_3a
    :goto_3a
    throw v0

    :cond_3b
    new-instance v5, Ljava/util/zip/CRC32;

    invoke-direct {v5}, Ljava/util/zip/CRC32;-><init>()V

    :try_start_40
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_45} :catch_66
    .catchall {:try_start_40 .. :try_end_45} :catchall_75

    :try_start_45
    new-instance v2, Ljava/util/zip/CheckedInputStream;

    invoke-direct {v2, v4, v5}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4a} :catch_99
    .catchall {:try_start_45 .. :try_end_4a} :catchall_94

    const/16 v3, 0x400

    :try_start_4c
    new-array v3, v3, [B

    :cond_4e
    invoke-virtual {v2, v3}, Ljava/util/zip/CheckedInputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_4e

    invoke-virtual {v5}, Ljava/util/zip/CRC32;->getValue()J
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_58} :catch_9c
    .catchall {:try_start_4c .. :try_end_58} :catchall_96

    move-result-wide v0

    if-eqz v4, :cond_5e

    :try_start_5b
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_92

    :cond_5e
    :goto_5e
    if-eqz v2, :cond_1e

    :try_start_60
    invoke-virtual {v2}, Ljava/util/zip/CheckedInputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_64

    goto :goto_1e

    :catch_64
    move-exception v2

    goto :goto_1e

    :catch_66
    move-exception v2

    move-object v2, v3

    :goto_68
    if-eqz v2, :cond_6d

    :try_start_6a
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_6a .. :try_end_6d} :catch_8c

    :cond_6d
    :goto_6d
    if-eqz v3, :cond_1e

    :try_start_6f
    invoke-virtual {v3}, Ljava/util/zip/CheckedInputStream;->close()V
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_6f .. :try_end_72} :catch_73

    goto :goto_1e

    :catch_73
    move-exception v2

    goto :goto_1e

    :catchall_75
    move-exception v0

    move-object v4, v3

    :goto_77
    if-eqz v4, :cond_7c

    :try_start_79
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_7c
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_7c} :catch_8e

    :cond_7c
    :goto_7c
    if-eqz v3, :cond_81

    :try_start_7e
    invoke-virtual {v3}, Ljava/util/zip/CheckedInputStream;->close()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_81} :catch_90

    :cond_81
    :goto_81
    throw v0

    :catch_82
    move-exception v2

    goto :goto_26

    :catch_84
    move-exception v1

    goto :goto_35

    :catch_86
    move-exception v1

    goto :goto_3a

    :catch_88
    move-exception v2

    goto :goto_13

    :catch_8a
    move-exception v2

    goto :goto_18

    :catch_8c
    move-exception v2

    goto :goto_6d

    :catch_8e
    move-exception v1

    goto :goto_7c

    :catch_90
    move-exception v1

    goto :goto_81

    :catch_92
    move-exception v3

    goto :goto_5e

    :catchall_94
    move-exception v0

    goto :goto_77

    :catchall_96
    move-exception v0

    move-object v3, v2

    goto :goto_77

    :catch_99
    move-exception v2

    move-object v2, v4

    goto :goto_68

    :catch_9c
    move-exception v3

    move-object v3, v2

    move-object v2, v4

    goto :goto_68

    :catchall_a0
    move-exception v0

    goto :goto_30

    :catch_a2
    move-exception v5

    goto/16 :goto_21
.end method

.method private static il()Z
    .registers 7

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_34
    .catchall {:try_start_2 .. :try_end_7} :catchall_43

    :try_start_7
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_93
    .catchall {:try_start_7 .. :try_end_c} :catchall_8e

    if-eqz v0, :cond_11

    :try_start_e
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_81

    :cond_11
    :goto_11
    if-eqz v2, :cond_16

    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_83

    :cond_16
    :goto_16
    const/4 v0, 0x0

    :try_start_17
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/io/FileInputStream;

    const-string v5, "/proc/self/maps"

    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_28} :catch_6a
    .catchall {:try_start_17 .. :try_end_28} :catchall_73

    :cond_28
    :try_start_28
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_8b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_89

    move-result-object v1

    if-nez v1, :cond_50

    :goto_2e
    if-eqz v2, :cond_33

    :try_start_30
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_87

    :cond_33
    :goto_33
    return v0

    :catch_34
    move-exception v0

    move-object v0, v1

    :goto_36
    if-eqz v0, :cond_3b

    :try_start_38
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_7b

    :cond_3b
    :goto_3b
    if-eqz v1, :cond_16

    :try_start_3d
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_40} :catch_41

    goto :goto_16

    :catch_41
    move-exception v0

    goto :goto_16

    :catchall_43
    move-exception v0

    move-object v2, v1

    :goto_45
    if-eqz v2, :cond_4a

    :try_start_47
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_4a} :catch_7d

    :cond_4a
    :goto_4a
    if-eqz v1, :cond_4f

    :try_start_4c
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_7f

    :cond_4f
    :goto_4f
    throw v0

    :cond_50
    :try_start_50
    const-string v3, "/system/lib64/libart.so"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_68

    const-string v3, "/system/lib64/libaoc.so"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_68

    const-string v3, "/system/bin/linker64"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_65} :catch_8b
    .catchall {:try_start_50 .. :try_end_65} :catchall_89

    move-result v1

    if-eqz v1, :cond_28

    :cond_68
    const/4 v0, 0x1

    goto :goto_2e

    :catch_6a
    move-exception v2

    :goto_6b
    if-eqz v1, :cond_33

    :try_start_6d
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_6d .. :try_end_70} :catch_71

    goto :goto_33

    :catch_71
    move-exception v1

    goto :goto_33

    :catchall_73
    move-exception v0

    move-object v2, v1

    :goto_75
    if-eqz v2, :cond_7a

    :try_start_77
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_85

    :cond_7a
    :goto_7a
    throw v0

    :catch_7b
    move-exception v0

    goto :goto_3b

    :catch_7d
    move-exception v2

    goto :goto_4a

    :catch_7f
    move-exception v1

    goto :goto_4f

    :catch_81
    move-exception v0

    goto :goto_11

    :catch_83
    move-exception v0

    goto :goto_16

    :catch_85
    move-exception v1

    goto :goto_7a

    :catch_87
    move-exception v1

    goto :goto_33

    :catchall_89
    move-exception v0

    goto :goto_75

    :catch_8b
    move-exception v1

    move-object v1, v2

    goto :goto_6b

    :catchall_8e
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    goto :goto_45

    :catch_93
    move-exception v2

    goto :goto_36
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .registers 7

    const/4 v1, 0x0

    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    const/4 v3, 0x0

    :try_start_5
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_27
    .catchall {:try_start_5 .. :try_end_a} :catchall_36

    :try_start_a
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_f} :catch_52
    .catchall {:try_start_a .. :try_end_f} :catchall_4d

    if-eqz v0, :cond_14

    :try_start_11
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_49

    :cond_14
    :goto_14
    if-eqz v2, :cond_19

    :try_start_16
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_19} :catch_4b

    :cond_19
    :goto_19
    invoke-virtual {p0, p1}, Ls/h/e/l/l/S;->l(Landroid/content/Context;)V

    const-string v0, "com.markuspage.android.atimetracker"

    invoke-static {p0, v0}, Ls/h/e/l/l/N;->l(Landroid/app/Application;Ljava/lang/String;)Z

    const-string v0, "android.app.Application"

    invoke-static {p0, v0}, Ls/h/e/l/l/N;->r(Landroid/app/Application;Ljava/lang/String;)Z

    return-void

    :catch_27
    move-exception v0

    move-object v0, v1

    :goto_29
    if-eqz v0, :cond_2e

    :try_start_2b
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2e} :catch_43

    :cond_2e
    :goto_2e
    if-eqz v1, :cond_19

    :try_start_30
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_33} :catch_34

    goto :goto_19

    :catch_34
    move-exception v0

    goto :goto_19

    :catchall_36
    move-exception v0

    move-object v2, v1

    :goto_38
    if-eqz v2, :cond_3d

    :try_start_3a
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3d} :catch_45

    :cond_3d
    :goto_3d
    if-eqz v1, :cond_42

    :try_start_3f
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_47

    :cond_42
    :goto_42
    throw v0

    :catch_43
    move-exception v0

    goto :goto_2e

    :catch_45
    move-exception v2

    goto :goto_3d

    :catch_47
    move-exception v1

    goto :goto_42

    :catch_49
    move-exception v0

    goto :goto_14

    :catch_4b
    move-exception v0

    goto :goto_19

    :catchall_4d
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_38

    :catch_52
    move-exception v2

    goto :goto_29
.end method

.method protected c(Ljava/lang/String;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    :try_start_4
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_79
    .catchall {:try_start_4 .. :try_end_9} :catchall_88

    :try_start_9
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_a6
    .catchall {:try_start_9 .. :try_end_e} :catchall_a1

    if-eqz v0, :cond_13

    :try_start_10
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_13} :catch_9b

    :cond_13
    :goto_13
    if-eqz v2, :cond_18

    :try_start_15
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_9e

    :cond_18
    :goto_18
    const-string v0, "assets/ijm_lib/%s/libexec.so"

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p1, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "assets/ijm_lib/%s/libexecmain.so"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    sget-object v3, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    const-string v4, "libexec.so"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    sget-object v4, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    const-string v5, "libexecmain.so"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/util/zip/ZipFile;

    invoke-virtual {p0}, Ls/h/e/l/l/S;->getPackageCodePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    if-eqz v0, :cond_5c

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v6

    invoke-static {v2}, Ls/h/e/l/l/S;->g(Ljava/io/File;)J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-eqz v5, :cond_5c

    invoke-direct {p0, v4, v0, v2}, Ls/h/e/l/l/S;->c(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/io/File;)V

    :cond_5c
    sget-boolean v0, Ls/h/e/l/l/S;->m:Z

    if-eqz v0, :cond_75

    invoke-virtual {v4, v1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    if-eqz v0, :cond_75

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v6

    invoke-static {v3}, Ls/h/e/l/l/S;->g(Ljava/io/File;)J

    move-result-wide v8

    cmp-long v1, v6, v8

    if-eqz v1, :cond_75

    invoke-direct {p0, v4, v0, v3}, Ls/h/e/l/l/S;->c(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/io/File;)V

    :cond_75
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V

    return-void

    :catch_79
    move-exception v0

    move-object v0, v1

    :goto_7b
    if-eqz v0, :cond_80

    :try_start_7d
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_80} :catch_95

    :cond_80
    :goto_80
    if-eqz v1, :cond_18

    :try_start_82
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_85} :catch_86

    goto :goto_18

    :catch_86
    move-exception v0

    goto :goto_18

    :catchall_88
    move-exception v0

    move-object v2, v1

    :goto_8a
    if-eqz v2, :cond_8f

    :try_start_8c
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_8f} :catch_97

    :cond_8f
    :goto_8f
    if-eqz v1, :cond_94

    :try_start_91
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_94
    .catch Ljava/lang/Exception; {:try_start_91 .. :try_end_94} :catch_99

    :cond_94
    :goto_94
    throw v0

    :catch_95
    move-exception v0

    goto :goto_80

    :catch_97
    move-exception v2

    goto :goto_8f

    :catch_99
    move-exception v1

    goto :goto_94

    :catch_9b
    move-exception v0

    goto/16 :goto_13

    :catch_9e
    move-exception v0

    goto/16 :goto_18

    :catchall_a1
    move-exception v2

    move-object v10, v2

    move-object v2, v0

    move-object v0, v10

    goto :goto_8a

    :catch_a6
    move-exception v2

    goto :goto_7b
.end method

.method protected l(Landroid/content/Context;)V
    .registers 7

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_5e
    .catchall {:try_start_2 .. :try_end_7} :catchall_6d

    :try_start_7
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_ac
    .catchall {:try_start_7 .. :try_end_c} :catchall_a7

    if-eqz v0, :cond_11

    :try_start_e
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_a1

    :cond_11
    :goto_11
    if-eqz v2, :cond_16

    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_a4

    :cond_16
    :goto_16
    :try_start_16
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const-string v3, "getprop ro.product.cpu.abi"

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Ls/h/e/l/l/S;->ld(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ae

    :goto_48
    if-eqz v0, :cond_89

    const-string v1, "x86"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_89

    invoke-static {}, Ls/h/e/l/l/S;->il()Z

    move-result v0

    if-eqz v0, :cond_7a

    const-string v0, "x86_64"

    invoke-virtual {p0, v0}, Ls/h/e/l/l/S;->c(Ljava/lang/String;)V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_5d} :catch_80

    :goto_5d
    return-void

    :catch_5e
    move-exception v0

    move-object v0, v1

    :goto_60
    if-eqz v0, :cond_65

    :try_start_62
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_9b

    :cond_65
    :goto_65
    if-eqz v1, :cond_16

    :try_start_67
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_6a} :catch_6b

    goto :goto_16

    :catch_6b
    move-exception v0

    goto :goto_16

    :catchall_6d
    move-exception v0

    move-object v2, v1

    :goto_6f
    if-eqz v2, :cond_74

    :try_start_71
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_74} :catch_9d

    :cond_74
    :goto_74
    if-eqz v1, :cond_79

    :try_start_76
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_79} :catch_9f

    :cond_79
    :goto_79
    throw v0

    :cond_7a
    :try_start_7a
    const-string v0, "x86"

    invoke-virtual {p0, v0}, Ls/h/e/l/l/S;->c(Ljava/lang/String;)V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7f} :catch_80

    goto :goto_5d

    :catch_80
    move-exception v0

    :try_start_81
    const-string v0, "armeabi"

    invoke-virtual {p0, v0}, Ls/h/e/l/l/S;->c(Ljava/lang/String;)V
    :try_end_86
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_86} :catch_87

    goto :goto_5d

    :catch_87
    move-exception v0

    goto :goto_5d

    :cond_89
    :try_start_89
    invoke-static {}, Ls/h/e/l/l/S;->il()Z

    move-result v0

    if-eqz v0, :cond_95

    const-string v0, "arm64-v8a"

    invoke-virtual {p0, v0}, Ls/h/e/l/l/S;->c(Ljava/lang/String;)V

    goto :goto_5d

    :cond_95
    const-string v0, "armeabi"

    invoke-virtual {p0, v0}, Ls/h/e/l/l/S;->c(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_9a} :catch_80

    goto :goto_5d

    :catch_9b
    move-exception v0

    goto :goto_65

    :catch_9d
    move-exception v2

    goto :goto_74

    :catch_9f
    move-exception v1

    goto :goto_79

    :catch_a1
    move-exception v0

    goto/16 :goto_11

    :catch_a4
    move-exception v0

    goto/16 :goto_16

    :catchall_a7
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_6f

    :catch_ac
    move-exception v2

    goto :goto_60

    :cond_ae
    move-object v0, v1

    goto :goto_48
.end method

.method protected ld(Landroid/content/Context;)Ljava/lang/String;
    .registers 8

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_47
    .catchall {:try_start_2 .. :try_end_7} :catchall_56

    :try_start_7
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_7a
    .catchall {:try_start_7 .. :try_end_c} :catchall_75

    if-eqz v0, :cond_11

    :try_start_e
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_6f

    :cond_11
    :goto_11
    if-eqz v2, :cond_16

    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_71

    :cond_16
    :goto_16
    const-string v0, ""

    :try_start_18
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "images/icon_max_data_encrypted_xxxxx.png"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_46

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    const/16 v1, 0x14

    new-array v1, v1, [B

    new-instance v2, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    const-string v4, "/system/bin/linker"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    if-eqz v2, :cond_46

    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    const/16 v2, 0x12

    aget-byte v1, v1, v2
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_43} :catch_73

    sparse-switch v1, :sswitch_data_7c

    :cond_46
    :goto_46
    return-object v0

    :catch_47
    move-exception v0

    move-object v0, v1

    :goto_49
    if-eqz v0, :cond_4e

    :try_start_4b
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4e} :catch_69

    :cond_4e
    :goto_4e
    if-eqz v1, :cond_16

    :try_start_50
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_53} :catch_54

    goto :goto_16

    :catch_54
    move-exception v0

    goto :goto_16

    :catchall_56
    move-exception v0

    move-object v2, v1

    :goto_58
    if-eqz v2, :cond_5d

    :try_start_5a
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_5d} :catch_6b

    :cond_5d
    :goto_5d
    if-eqz v1, :cond_62

    :try_start_5f
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_62} :catch_6d

    :cond_62
    :goto_62
    throw v0

    :sswitch_63
    :try_start_63
    const-string v0, "x86"

    goto :goto_46

    :sswitch_66
    const-string v0, "armeabi"
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_68} :catch_73

    goto :goto_46

    :catch_69
    move-exception v0

    goto :goto_4e

    :catch_6b
    move-exception v2

    goto :goto_5d

    :catch_6d
    move-exception v1

    goto :goto_62

    :catch_6f
    move-exception v0

    goto :goto_11

    :catch_71
    move-exception v0

    goto :goto_16

    :catch_73
    move-exception v1

    goto :goto_46

    :catchall_75
    move-exception v2

    move-object v5, v2

    move-object v2, v0

    move-object v0, v5

    goto :goto_58

    :catch_7a
    move-exception v2

    goto :goto_49

    :sswitch_data_7c
    .sparse-switch
        0x3 -> :sswitch_63
        0x28 -> :sswitch_66
    .end sparse-switch
.end method

.method public onCreate()V
    .registers 6

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_28
    .catchall {:try_start_2 .. :try_end_7} :catchall_37

    :try_start_7
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_53
    .catchall {:try_start_7 .. :try_end_c} :catchall_4e

    if-eqz v0, :cond_11

    :try_start_e
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_4a

    :cond_11
    :goto_11
    if-eqz v2, :cond_16

    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_4c

    :cond_16
    :goto_16
    const-string v0, "android.app.Application"

    invoke-static {p0, v0}, Ls/h/e/l/l/N;->ra(Landroid/app/Application;Ljava/lang/String;)Z

    sget-object v0, Ls/h/e/l/l/S;->n:Landroid/app/Application;

    if-eqz v0, :cond_24

    sget-object v0, Ls/h/e/l/l/S;->n:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onCreate()V

    :cond_24
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    return-void

    :catch_28
    move-exception v0

    move-object v0, v1

    :goto_2a
    if-eqz v0, :cond_2f

    :try_start_2c
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2f} :catch_44

    :cond_2f
    :goto_2f
    if-eqz v1, :cond_16

    :try_start_31
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_35

    goto :goto_16

    :catch_35
    move-exception v0

    goto :goto_16

    :catchall_37
    move-exception v0

    move-object v2, v1

    :goto_39
    if-eqz v2, :cond_3e

    :try_start_3b
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_46

    :cond_3e
    :goto_3e
    if-eqz v1, :cond_43

    :try_start_40
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_43} :catch_48

    :cond_43
    :goto_43
    throw v0

    :catch_44
    move-exception v0

    goto :goto_2f

    :catch_46
    move-exception v2

    goto :goto_3e

    :catch_48
    move-exception v1

    goto :goto_43

    :catch_4a
    move-exception v0

    goto :goto_11

    :catch_4c
    move-exception v0

    goto :goto_16

    :catchall_4e
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_39

    :catch_53
    move-exception v2

    goto :goto_2a
.end method

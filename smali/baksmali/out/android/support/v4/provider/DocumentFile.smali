.class public abstract Landroid/support/v4/provider/DocumentFile;
.super Ljava/lang/Object;
.source "DocumentFile.java"


# static fields
.field static final TAG:Ljava/lang/String; = "DocumentFile"


# instance fields
.field private final mParent:Landroid/support/v4/provider/DocumentFile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v4/provider/DocumentFile;)V
    .registers 2
    .param p1    # Landroid/support/v4/provider/DocumentFile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/provider/DocumentFile;->mParent:Landroid/support/v4/provider/DocumentFile;

    return-void
.end method

.method public static fromFile(Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;
    .registers 3
    .param p0    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Landroid/support/v4/provider/RawDocumentFile;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Landroid/support/v4/provider/RawDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Ljava/io/File;)V

    return-object v0
.end method

.method public static fromSingleUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;
    .registers 5
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x13

    if-lt v0, v2, :cond_d

    new-instance v0, Landroid/support/v4/provider/SingleDocumentFile;

    invoke-direct {v0, v1, p0, p1}, Landroid/support/v4/provider/SingleDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Landroid/content/Context;Landroid/net/Uri;)V

    return-object v0

    :cond_d
    return-object v1
.end method

.method public static fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;
    .registers 5
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_15

    new-instance v0, Landroid/support/v4/provider/TreeDocumentFile;

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p0, p1}, Landroid/support/v4/provider/TreeDocumentFile;-><init>(Landroid/support/v4/provider/DocumentFile;Landroid/content/Context;Landroid/net/Uri;)V

    return-object v0

    :cond_15
    return-object v1
.end method

.method public static isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public abstract canRead()Z
.end method

.method public abstract canWrite()Z
.end method

.method public abstract createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract delete()Z
.end method

.method public abstract exists()Z
.end method

.method public findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;
    .registers 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/provider/DocumentFile;->listFiles()[Landroid/support/v4/provider/DocumentFile;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_18

    aget-object v3, v0, v2

    invoke-virtual {v3}, Landroid/support/v4/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    return-object v3

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_18
    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getName()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public getParentFile()Landroid/support/v4/provider/DocumentFile;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/provider/DocumentFile;->mParent:Landroid/support/v4/provider/DocumentFile;

    return-object v0
.end method

.method public abstract getType()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getUri()Landroid/net/Uri;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract isDirectory()Z
.end method

.method public abstract isFile()Z
.end method

.method public abstract isVirtual()Z
.end method

.method public abstract lastModified()J
.end method

.method public abstract length()J
.end method

.method public abstract listFiles()[Landroid/support/v4/provider/DocumentFile;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract renameTo(Ljava/lang/String;)Z
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

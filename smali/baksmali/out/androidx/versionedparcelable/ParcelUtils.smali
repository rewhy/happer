.class public Landroidx/versionedparcelable/ParcelUtils;
.super Ljava/lang/Object;
.source "ParcelUtils.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    return-void

    nop

    nop

    nop
.end method

.method public static fromInputStream(Ljava/io/InputStream;)Landroidx/versionedparcelable/VersionedParcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public static fromParcelable(Landroid/os/Parcelable;)Landroidx/versionedparcelable/VersionedParcelable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(",
            "Landroid/os/Parcelable;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public static toOutputStream(Landroidx/versionedparcelable/VersionedParcelable;Ljava/io/OutputStream;)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public static toParcelable(Landroidx/versionedparcelable/VersionedParcelable;)Landroid/os/Parcelable;
    .registers 2

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop
.end method

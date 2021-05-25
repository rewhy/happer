.class public abstract Landroidx/versionedparcelable/VersionedParcel;
.super Ljava/lang/Object;
.source "VersionedParcel.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/versionedparcelable/VersionedParcel$ParcelException;
    }
.end annotation


# static fields
.field private static final EX_BAD_PARCELABLE:I = -0x2

.field private static final EX_ILLEGAL_ARGUMENT:I = -0x3

.field private static final EX_ILLEGAL_STATE:I = -0x5

.field private static final EX_NETWORK_MAIN_THREAD:I = -0x6

.field private static final EX_NULL_POINTER:I = -0x4

.field private static final EX_PARCELABLE:I = -0x9

.field private static final EX_SECURITY:I = -0x1

.field private static final EX_UNSUPPORTED_OPERATION:I = -0x7

.field private static final TAG:Ljava/lang/String; = "VersionedParcel"

.field private static final TYPE_BINDER:I = 0x5

.field private static final TYPE_PARCELABLE:I = 0x2

.field private static final TYPE_SERIALIZABLE:I = 0x3

.field private static final TYPE_STRING:I = 0x4

.field private static final TYPE_VERSIONED_PARCELABLE:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 1

    return-void

    nop

    nop

    nop
.end method

.method private createException(ILjava/lang/String;)Ljava/lang/Exception;
    .registers 6

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

    nop

    nop
.end method

.method private static findParcelClass(Landroidx/versionedparcelable/VersionedParcelable;)Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(TT;)",
            "Ljava/lang/Class;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method private static findParcelClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">;)",
            "Ljava/lang/Class;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
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

.method protected static getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 2
    .param p0    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
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
.end method

.method private getType(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)I"
        }
    .end annotation

    const/4 v0, 0x0

    return v0

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method private readCollection(ILjava/util/Collection;)Ljava/util/Collection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S::",
            "Ljava/util/Collection<",
            "TT;>;>(ITS;)TS;"
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

.method private readException(ILjava/lang/String;)Ljava/lang/Exception;
    .registers 3

    const/4 p0, 0x0

    return-object p0

    nop

    nop

    nop
.end method

.method private readExceptionCode()I
    .registers 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop
.end method

.method protected static readFromParcel(Ljava/lang/String;Landroidx/versionedparcelable/VersionedParcel;)Landroidx/versionedparcelable/VersionedParcelable;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(",
            "Ljava/lang/String;",
            "Landroidx/versionedparcelable/VersionedParcel;",
            ")TT;"
        }
    .end annotation

    :try_start_0
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
    :try_end_23
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_23} :catch_4e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_23} :catch_36
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_23} :catch_2d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_23} :catch_24

    nop

    :catch_24
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_2d
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_36
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_4e
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

.method private writeCollection(Ljava/util/Collection;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "TT;>;I)V"
        }
    .end annotation

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

    nop

    nop

    nop

    nop

    nop
.end method

.method private writeSerializable(Ljava/io/Serializable;)V
    .registers 6

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

    :try_start_17
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

    nop
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_29} :catch_2a

    nop

    :catch_2a
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

.method protected static writeToParcel(Landroidx/versionedparcelable/VersionedParcelable;Landroidx/versionedparcelable/VersionedParcel;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(TT;",
            "Landroidx/versionedparcelable/VersionedParcel;",
            ")V"
        }
    .end annotation

    :try_start_0
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

    nop

    nop

    nop

    nop

    nop
    :try_end_23
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_23} :catch_4e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_23} :catch_36
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_23} :catch_2d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_23} :catch_24

    nop

    :catch_24
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_2d
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_36
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_4e
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

.method private writeVersionedParcelableCreator(Landroidx/versionedparcelable/VersionedParcelable;)V
    .registers 5

    :try_start_0
    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_8} :catch_10

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_10
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


# virtual methods
.method protected abstract closeField()V
.end method

.method protected abstract createSubParcel()Landroidx/versionedparcelable/VersionedParcel;
.end method

.method public isStream()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method protected readArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
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

    nop

    nop
.end method

.method public readArray([Ljava/lang/Object;I)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract readBoolean()Z
.end method

.method public readBoolean(ZI)Z
    .registers 3

    const/4 p0, 0x0

    return p0

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

.method protected readBooleanArray()[Z
    .registers 6

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

.method public readBooleanArray([ZI)[Z
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract readBundle()Landroid/os/Bundle;
.end method

.method public readBundle(Landroid/os/Bundle;I)Landroid/os/Bundle;
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method public readByte(BI)B
    .registers 3

    const/4 p0, 0x0

    return p0

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

.method protected abstract readByteArray()[B
.end method

.method public readByteArray([BI)[B
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method public readCharArray([CI)[C
    .registers 5

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

.method protected abstract readDouble()D
.end method

.method public readDouble(DI)D
    .registers 4

    const-wide/16 p0, 0x0

    return-wide p0

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

.method protected readDoubleArray()[D
    .registers 6

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

    nop

    nop

    nop

    nop
.end method

.method public readDoubleArray([DI)[D
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method public readException(Ljava/lang/Exception;I)Ljava/lang/Exception;
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

    nop

    nop

    nop

    nop
.end method

.method protected abstract readField(I)Z
.end method

.method protected abstract readFloat()F
.end method

.method public readFloat(FI)F
    .registers 3

    const/4 p0, 0x0

    return p0

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

.method protected readFloatArray()[F
    .registers 5

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

    nop

    nop

    nop

    nop
.end method

.method public readFloatArray([FI)[F
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract readInt()I
.end method

.method public readInt(II)I
    .registers 3

    const/4 p0, 0x0

    return p0

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

.method protected readIntArray()[I
    .registers 5

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

    nop

    nop

    nop

    nop
.end method

.method public readIntArray([II)[I
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method public readList(Ljava/util/List;I)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;I)",
            "Ljava/util/List<",
            "TT;>;"
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

.method protected abstract readLong()J
.end method

.method public readLong(JI)J
    .registers 4

    const-wide/16 p0, 0x0

    return-wide p0

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

.method protected readLongArray()[J
    .registers 6

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

    nop

    nop

    nop

    nop
.end method

.method public readLongArray([JI)[J
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract readParcelable()Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation
.end method

.method public readParcelable(Landroid/os/Parcelable;I)Landroid/os/Parcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

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

.method protected readSerializable()Ljava/io/Serializable;
    .registers 6

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

    :try_start_11
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
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_1c} :catch_3a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_11 .. :try_end_1c} :catch_1d

    nop

    :catch_1d
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

    :catch_3a
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

.method public readSet(Ljava/util/Set;I)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;I)",
            "Ljava/util/Set<",
            "TT;>;"
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

.method public readSize(Landroid/util/Size;I)Landroid/util/Size;
    .registers 4
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
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

.method public readSizeF(Landroid/util/SizeF;I)Landroid/util/SizeF;
    .registers 4
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
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

.method public readSparseBooleanArray(Landroid/util/SparseBooleanArray;I)Landroid/util/SparseBooleanArray;
    .registers 6

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

    nop

    nop
.end method

.method protected abstract readString()Ljava/lang/String;
.end method

.method public readString(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract readStrongBinder()Landroid/os/IBinder;
.end method

.method public readStrongBinder(Landroid/os/IBinder;I)Landroid/os/IBinder;
    .registers 3

    const/4 p0, 0x0

    return-object p0

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

.method protected readVersionedParcelable()Landroidx/versionedparcelable/VersionedParcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">()TT;"
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
.end method

.method public readVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)Landroidx/versionedparcelable/VersionedParcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0

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

.method protected abstract setOutputField(I)V
.end method

.method public setSerializationFlags(ZZ)V
    .registers 3

    return-void
.end method

.method protected writeArray([Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)V"
        }
    .end annotation

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

    nop

    nop

    nop

    nop
.end method

.method public writeArray([Ljava/lang/Object;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeBoolean(Z)V
.end method

.method public writeBoolean(ZI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeBooleanArray([Z)V
    .registers 5

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

.method public writeBooleanArray([ZI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeBundle(Landroid/os/Bundle;)V
.end method

.method public writeBundle(Landroid/os/Bundle;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeByte(BI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeByteArray([B)V
.end method

.method public writeByteArray([BI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeByteArray([BII)V
.end method

.method public writeByteArray([BIII)V
    .registers 5

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeCharArray([CI)V
    .registers 5

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

.method protected abstract writeDouble(D)V
.end method

.method public writeDouble(DI)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeDoubleArray([D)V
    .registers 6

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

.method public writeDoubleArray([DI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeException(Ljava/lang/Exception;I)V
    .registers 6

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

.method protected abstract writeFloat(F)V
.end method

.method public writeFloat(FI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeFloatArray([F)V
    .registers 5

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

.method public writeFloatArray([FI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeInt(I)V
.end method

.method public writeInt(II)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeIntArray([I)V
    .registers 5

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

.method public writeIntArray([II)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeList(Ljava/util/List;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;I)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop
.end method

.method protected abstract writeLong(J)V
.end method

.method public writeLong(JI)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeLongArray([J)V
    .registers 6

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

.method public writeLongArray([JI)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeNoException()V
    .registers 2

    return-void

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeParcelable(Landroid/os/Parcelable;)V
.end method

.method public writeParcelable(Landroid/os/Parcelable;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeSerializable(Ljava/io/Serializable;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeSet(Ljava/util/Set;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;I)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop
.end method

.method public writeSize(Landroid/util/Size;I)V
    .registers 3
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

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

.method public writeSizeF(Landroid/util/SizeF;I)V
    .registers 3
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

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

.method public writeSparseBooleanArray(Landroid/util/SparseBooleanArray;I)V
    .registers 5

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeString(Ljava/lang/String;)V
.end method

.method public writeString(Ljava/lang/String;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeStrongBinder(Landroid/os/IBinder;)V
.end method

.method public writeStrongBinder(Landroid/os/IBinder;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected abstract writeStrongInterface(Landroid/os/IInterface;)V
.end method

.method public writeStrongInterface(Landroid/os/IInterface;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V
    .registers 3

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

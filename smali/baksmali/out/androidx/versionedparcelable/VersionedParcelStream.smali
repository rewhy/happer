.class Landroidx/versionedparcelable/VersionedParcelStream;
.super Landroidx/versionedparcelable/VersionedParcel;
.source "VersionedParcelStream.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/versionedparcelable/VersionedParcelStream$InputBuffer;,
        Landroidx/versionedparcelable/VersionedParcelStream$FieldBuffer;
    }
.end annotation


# static fields
.field private static final TYPE_BOOLEAN:I = 0x5

.field private static final TYPE_BOOLEAN_ARRAY:I = 0x6

.field private static final TYPE_DOUBLE:I = 0x7

.field private static final TYPE_DOUBLE_ARRAY:I = 0x8

.field private static final TYPE_FLOAT:I = 0xd

.field private static final TYPE_FLOAT_ARRAY:I = 0xe

.field private static final TYPE_INT:I = 0x9

.field private static final TYPE_INT_ARRAY:I = 0xa

.field private static final TYPE_LONG:I = 0xb

.field private static final TYPE_LONG_ARRAY:I = 0xc

.field private static final TYPE_NULL:I = 0x0

.field private static final TYPE_STRING:I = 0x3

.field private static final TYPE_STRING_ARRAY:I = 0x4

.field private static final TYPE_SUB_BUNDLE:I = 0x1

.field private static final TYPE_SUB_PERSISTABLE_BUNDLE:I = 0x2

.field private static final UTF_16:Ljava/nio/charset/Charset;


# instance fields
.field private final mCachedFields:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroidx/versionedparcelable/VersionedParcelStream$InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentInput:Ljava/io/DataInputStream;

.field private mCurrentOutput:Ljava/io/DataOutputStream;

.field private mFieldBuffer:Landroidx/versionedparcelable/VersionedParcelStream$FieldBuffer;

.field private mIgnoreParcelables:Z

.field private final mMasterInput:Ljava/io/DataInputStream;

.field private final mMasterOutput:Ljava/io/DataOutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "UTF-16"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Landroidx/versionedparcelable/VersionedParcelStream;->UTF_16:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
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

    nop

    nop
.end method

.method private readObject(ILjava/lang/String;Landroid/os/Bundle;)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method private writeObject(Ljava/lang/Object;)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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
.method public closeField()V
    .registers 3

    return-void

    nop

    nop

    nop

    :try_start_4
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_13} :catch_17

    nop

    nop

    nop

    nop

    :catch_17
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method protected createSubParcel()Landroidx/versionedparcelable/VersionedParcel;
    .registers 4

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
.end method

.method public isStream()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public readBoolean()Z
    .registers 3

    :try_start_0
    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    nop

    :catch_7
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readBundle()Landroid/os/Bundle;
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
.end method

.method public readByteArray()[B
    .registers 3

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
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_12

    nop

    nop

    nop

    :catch_12
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readDouble()D
    .registers 3

    :try_start_0
    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    nop

    :catch_7
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readField(I)Z
    .registers 7

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

    :try_start_15
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_42} :catch_43

    nop

    :catch_43
    nop

    nop
.end method

.method public readFloat()F
    .registers 3

    :try_start_0
    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    nop

    :catch_7
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readInt()I
    .registers 3

    :try_start_0
    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    nop

    :catch_7
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readLong()J
    .registers 3

    :try_start_0
    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    nop

    :catch_7
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readParcelable()Landroid/os/Parcelable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public readString()Ljava/lang/String;
    .registers 4

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
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_16} :catch_19

    nop

    nop

    nop

    :catch_19
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public readStrongBinder()Landroid/os/IBinder;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public setOutputField(I)V
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

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public setSerializationFlags(ZZ)V
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
.end method

.method public writeBoolean(Z)V
    .registers 3

    :try_start_0
    return-void

    nop

    nop

    nop

    nop
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    nop

    :catch_6
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .registers 5

    return-void

    nop

    :try_start_2
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_32} :catch_2a

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeByteArray([B)V
    .registers 4

    return-void

    nop

    :try_start_2
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_e
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_16} :catch_e

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeByteArray([BII)V
    .registers 5

    return-void

    nop

    :try_start_2
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_d
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_d

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeDouble(D)V
    .registers 4

    :try_start_0
    return-void

    nop

    nop

    nop

    nop
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    nop

    :catch_6
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeFloat(F)V
    .registers 3

    :try_start_0
    return-void

    nop

    nop

    nop

    nop
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    nop

    :catch_6
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeInt(I)V
    .registers 3

    :try_start_0
    return-void

    nop

    nop

    nop

    nop
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    nop

    :catch_6
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeLong(J)V
    .registers 4

    :try_start_0
    return-void

    nop

    nop

    nop

    nop
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    nop

    :catch_6
    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeParcelable(Landroid/os/Parcelable;)V
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
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 4

    return-void

    nop

    :try_start_2
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :catch_14
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1c} :catch_14

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeStrongBinder(Landroid/os/IBinder;)V
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
.end method

.method public writeStrongInterface(Landroid/os/IInterface;)V
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
.end method

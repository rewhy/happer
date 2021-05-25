.class Landroidx/versionedparcelable/VersionedParcelParcel;
.super Landroidx/versionedparcelable/VersionedParcel;
.source "VersionedParcelParcel.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "VersionedParcelParcel"


# instance fields
.field private mCurrentField:I

.field private final mEnd:I

.field private mNextRead:I

.field private final mOffset:I

.field private final mParcel:Landroid/os/Parcel;

.field private final mPositionLookup:Landroid/util/SparseIntArray;

.field private final mPrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/os/Parcel;)V
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
.end method

.method constructor <init>(Landroid/os/Parcel;IILjava/lang/String;)V
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
.end method

.method private readUntilField(I)I
    .registers 5

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
.end method


# virtual methods
.method public closeField()V
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
.end method

.method protected createSubParcel()Landroidx/versionedparcelable/VersionedParcel;
    .registers 7

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
.end method

.method public readBoolean()Z
    .registers 2

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
.end method

.method public readBundle()Landroid/os/Bundle;
    .registers 3

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
.end method

.method public readByteArray()[B
    .registers 3

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
.end method

.method public readDouble()D
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop

    nop
.end method

.method public readField(I)Z
    .registers 3

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
.end method

.method public readFloat()F
    .registers 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop
.end method

.method public readInt()I
    .registers 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop
.end method

.method public readLong()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop

    nop
.end method

.method public readParcelable()Landroid/os/Parcelable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
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
.end method

.method public readString()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    return-object v0

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

    nop

    nop

    nop

    nop

    nop
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

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeBoolean(Z)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .registers 3

    return-void

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public writeByteArray([BII)V
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
.end method

.method public writeDouble(D)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeFloat(F)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeInt(I)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeLong(J)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeParcelable(Landroid/os/Parcelable;)V
    .registers 4

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 3

    return-void

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
.end method

.method public writeStrongInterface(Landroid/os/IInterface;)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

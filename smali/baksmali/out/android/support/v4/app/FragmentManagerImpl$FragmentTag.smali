.class Landroid/support/v4/app/FragmentManagerImpl$FragmentTag;
.super Ljava/lang/Object;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/FragmentManagerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FragmentTag"
.end annotation


# static fields
.field public static final Fragment:[I

.field public static final Fragment_id:I = 0x1

.field public static final Fragment_name:I = 0x0

.field public static final Fragment_tag:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v4/app/FragmentManagerImpl$FragmentTag;->Fragment:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1010003
        0x10100d0
        0x10100d1
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

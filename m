Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402225;
	b=veNqDNjaMqiARXRNZ1ek+USRV1TqDg6mMDpvpPlwHPGQ7h5EZ3poJ9+5Xds/K9buRUt2
	 /hAs/bH1weEkjJIy1sho0CW8WRMwcfxZgSDBKbUdz3yYjHWyNixsLSNBY9+/la5jNFAt1
	 TUwcp/HyHGqKk4GL3UdAmy9G5C4ON4TRL9ANHT5s01Tnx1ybYj1xZmPzQSkxt7bYYhmaq
	 Zj7BocnMR52vXsc9h28DT3kHtHDZ3DIuQeGxzq1B3WEGh75qrnfiwnpnqH7Piiv6e+Ave
	 okSymvDFh2aw2zkL2w93+lrIlj8eMC8nwPHPeip0GeUkJaAl2BRviUq7/vQ/h5sssfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402225;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGUSO64aDmeiomTwHSqW1O+T0fU2bJipEwmEC3CjH5M=;
	b=jLRnH7FEFhMsSbN8Qbr2etzgYlmayf51QCDWPPMg23kQH8PDFDkPmqpaxqPbdPd+qCOL
	 qgwzYromZ9sm9FWAQqNdAPX0ZY1PtCmGW4XS8y9Jh+zYIqBYb+Da4CUtaABhg9pVKPtpp
	 GSUOQpUzpadbp9QU7txzwUyUFtIrE2c4PTx3mH7ptvZ979bisrvjQP4BcqNMhq5lb75UA
	 /w39ENovF/81n+I+l4T1x1wFPFBo6Fd+s5hY6xZU7d+wSkRpqxyODRMsqt5sEJQXSj2+2
	 VtVbKyQ8bqRZgY5UM7gWBKZKMd9TYYM2JRu2UWb1WIBIrYwvHHVBpNor6RYCWBvnRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=EzasSOUt;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F1D606A31A;
	Mon, 23 Nov 2026 02:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F1D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=EzasSOUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=EzasSOUt0qH4hDp9s9jqGeqmEXarED731bZ0ZO5vZjnWmTgpJjeS0lvti0YFtY9mxKN0ivMiYwVqF
	 h+DYiSxSKWt7IlSr1Qh0Ydkgxld39lFbQX4zqs8vFdDm75Rz12TRXuWBtUPJ/+zO+cOdj+6wTzxhd/
	 HRWsrhUWGdIAdm30=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b03a9ed907-d800e;
	Mon, 23 Nov 2026 10:50:22 +0800 (CST)
X-RM-TRANSID:2ee46b03a9ed907-d800e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56b03a9ebdf3-83b5a;
	Mon, 23 Nov 2026 10:50:21 +0800 (CST)
X-RM-TRANSID:2ee56b03a9ebdf3-83b5a
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: bleung@chromium.org,
	lee@kernel.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v3] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Mon, 23 Nov 2026 10:50:22 +0800
Message-ID: <20261123025022.1761-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ec_device_probe() calls of_find_compatible_node() only to check=0D
whether a "google,cros-ec-ucsi" node exists in the device tree, but=0D
the reference held by the returned node is never dropped.=0D
=0D
Scope the lookup to the UCSI block and mark the node pointer with=0D
__free(device_node), so that the reference is released automatically=0D
when the block is left.  Keeping the lookup inside the block also=0D
preserves the short-circuit evaluation of the original condition:=0D
the device tree is only walked when the EC_FEATURE_USB_PD,=0D
EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on=0D
every probe of every cros_ec device.=0D
=0D
Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defined=
 in OF or ACPI")=0D
Suggested-by: Benson Leung <bleung@chromium.org>=0D
Reviewed-by: Benson Leung <bleung@chromium.org>=0D
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>=0D
---=0D
=0D
Changes in v3:=0D
- Add the missing <linux/cleanup.h> include for __free() and fix the=0D
  continuation alignment of the mfd_add_hotplug_devices() call, as=0D
  pointed out by Tzung-Bi Shih.  No functional change.=0D
=0D
Link: https://lore.kernel.org/r/20261118062949.1250-1-laixiangwu@cmss.china=
mobile.com=0D
=0D
 drivers/mfd/cros_ec_dev.c | 21 ++++++++++++++-------=0D
 1 file changed, 14 insertions(+), 7 deletions(-)=0D
=0D
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c=0D
index 529a23b80..cd1ce833a 100644=0D
--- a/drivers/mfd/cros_ec_dev.c=0D
+++ b/drivers/mfd/cros_ec_dev.c=0D
@@ -6,6 +6,7 @@=0D
  */=0D
 =0D
 #include <linux/acpi.h>=0D
+#include <linux/cleanup.h>=0D
 #include <linux/dmi.h>=0D
 #include <linux/kconfig.h>=0D
 #include <linux/mfd/core.h>=0D
@@ -271,14 +272,20 @@ static int ec_device_probe(struct platform_device *pd=
ev)=0D
 	 */=0D
 	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&=0D
 	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&=0D
-	    !acpi_dev_found("GOOG0021") &&=0D
-	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {=0D
-		retval =3D mfd_add_hotplug_devices(ec->dev,=0D
-						 cros_ec_ucsi_cells,=0D
-						 ARRAY_SIZE(cros_ec_ucsi_cells));=0D
+	    !acpi_dev_found("GOOG0021")) {=0D
+		struct device_node *np __free(device_node) =3D=0D
+			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");=0D
 =0D
-		if (retval)=0D
-			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);=0D
+		if (!np) {=0D
+			retval =3D mfd_add_hotplug_devices(ec->dev,=0D
+							 cros_ec_ucsi_cells,=0D
+							 ARRAY_SIZE(cros_ec_ucsi_cells));=0D
+=0D
+			if (retval)=0D
+				dev_warn(ec->dev,=0D
+					 "failed to add cros_ec_ucsi: %d\n",=0D
+					 retval);=0D
+		}=0D
 	}=0D
 =0D
 	/*=0D
-- =0D
2.50.1.windows.1=0D
=0D



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965979;
	b=aVST5Jj2Krg2+M0lXEQIZ1FbVn4Spn7DWYh0Qu77H6JJgaXQ8Xkok+Twex9dZbCg7Jm/
	 YScsMT0sv/5RhLYqG8THOwJp/uaUdOPtmdowLBO8ZRDeEIKeTGzsXL67S88t+6oS6I89y
	 FZiGPGaEqO9qiYGA2OEv98rjMcHA8N19RVPh9049juakyXiJLRVm9qbim9WENri6W00U3
	 PR5daT0dU4k6aVMQugba78nGiiA/IMJgGzre7FBFtGiS5vmtCJeFB0+1WpztabniA+fl7
	 B9KhTeSFM+e8zCC+8pssBDxCvMDDHSL0MbqBDg5NRQS9JETpgwhSNFGEF/YOlI+HhRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965979;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CfZGs2YcSTDTCe3bXA/FH9z9mPCB5kV5LoM+XXlDKaQ=;
	b=Hb4gZLhQBJKWZ+Y1opC4doa8D8gM+oQvVGWxYEPtHxriMileqxIFkstv8PQkOiWi7bni
	 5OYqZDzI9mYBP87hTQGjv6jNcmNFxwcrJdWx2Vtfrlms9bMT3EtuScOYG4bTLfFbkfdrC
	 rrYQ9eW/UkYufhGhoNEwEFyC9Xc8OQfvlB75Vd86SHbyR01Ss3o/A2huacSTYQuSKvG4q
	 Gx2jRB1c2tz/zf7AKeSdeFfjk0j4sfxRi7zfsGf9kvShn++TMo7bcRV6EdDhXJlNehOBq
	 X/Ngby1tYgAPFjeDdrpsOUFM8eD+TCQCN3hzkKgLhnA/c77G0yxGSNh/TmzWPmd19Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=P4+RC438;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182EE606A31C;
	Wed, 18 Nov 2026 01:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=P4+RC438
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=P4+RC4382pHkEn8BJ4cBTMWJw3WTCszmqHyUrmC8mRnBxxiQPIkHNjntNOrAwTv9OXU5UmLE4GsYM
	 dPC7gK1vadki3pj1KZU+79FmVqyOXVQfI+B8/atYddRaUJWgL6oYH651xh9g+aicoLOeNBt/Y3J796
	 HiJNa4cqWfrz9sv4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd01d8790-adb51;
	Wed, 18 Nov 2026 09:39:36 +0800 (CST)
X-RM-TRANSID:2ee46afd01d8790-adb51
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afd01d7c61-c2393;
	Wed, 18 Nov 2026 09:39:36 +0800 (CST)
X-RM-TRANSID:2ee36afd01d7c61-c2393
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
Subject: [PATCH] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Wed, 18 Nov 2026 09:39:34 +0800
Message-ID: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
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
Content-Transfer-Encoding: 8bit

ec_device_probe() calls of_find_compatible_node() only to check
whether a "google,cros-ec-ucsi" node exists in the device tree, but
the reference held by the returned node is never dropped.

Keep the node pointer in a local variable and release the reference
with of_node_put() right after the lookup.

Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/mfd/cros_ec_dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b80..593297df5 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -184,6 +184,7 @@ static int ec_device_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct cros_ec_platform *ec_platform = dev_get_platdata(dev);
 	struct cros_ec_dev *ec = kzalloc_obj(*ec);
+	struct device_node *np;
 	struct ec_response_pchg_count pchg_count;
 	int i;
 
@@ -269,10 +270,12 @@ static int ec_device_probe(struct platform_device *pdev)
 	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
 	 * the driver should be added as an mfd subdevice.
 	 */
+	np = of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
+	of_node_put(np);
+
 	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
 	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
-	    !acpi_dev_found("GOOG0021") &&
-	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
+	    !acpi_dev_found("GOOG0021") && !np) {
 		retval = mfd_add_hotplug_devices(ec->dev,
 						 cros_ec_ucsi_cells,
 						 ARRAY_SIZE(cros_ec_ucsi_cells));
-- 
2.50.1.windows.1




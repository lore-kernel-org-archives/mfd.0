Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869309;
	b=a8HPgqj/i83fjtLu+SOPuE22Dj9I5zboYBnPrzYTUQvsBDJQ1mVC+gF4OS5KwhOTUbNz
	 TW7AUMqGnRQ1DPYI1i+y/U/dtk6o+bUzuNzB/bzBEJTI9o7uyEnkCCS0RATWLQhwk4IpE
	 dceU7cnpkZ9iCS428724IcaVJQc5gydpSTFCtxu03L2QkaS9fZl4UrTThuQRMtJUr/K/o
	 ZAcHyMZ6Pck1DRmoWHERSfPxGmLm0kcfarGHWrfsQRKaD4alEx1D28vR0lGopFMPQZoM2
	 AuXHxJEVvf1G0u0BG67r+yXjCtiY6QyeLhC+F8iBaHgh288EmZKlJkrc9JpMqljUayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
	b=q6Krui0671E/g0BwPi05iTkBessLyHN2TC8yW3VSLHpWWAmIIsn5+opTPVi9vTT3zNaN
	 7SSIndRKFggRseAfJeKTXOQEK7nb/2SU9kq3y9MnMrkju1YX1rI8ayEDguXiBxYmhcQot
	 FARTtHO0g6grhcOEm+XgxbdtAu1sbPooA1e5Rgc+5RTFY6zDGzF3bHjF8y/AxpqF2QZ6L
	 TW65XS9/VGXZoOag59e8VpksbynmrqyOIaC/vxLlImIWlYQvsl6+J2HNA/SKQyLgjYq3T
	 jo1hC7rj99y4eY9PmVpRXA5ATJZJaLs4utqjOLIiH5OifKUUWihbCD8XQIr4XMxI8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnugZclL;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F6F606A331
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F6F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnugZclL
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0dba37a7fso37780327b3.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869308; x=1795474108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=mnugZclL1bia+g4S5QuEGJtC05tZ1Sotz2EX8Af5BnBOIbaDkVaFyUg+7zttgeECeY
         1MACz0h+k5mmQQvb4353GHBqWlYVHJ1conhNxwXKhCmbKfxQlpCd4DLfptQFY4kO59s9
         uKWnUh1t6D7EHDC78X2kQCXSzIsEgJIQZJbEjMUEAYc+WlenfBIUqStNBQ1fF0vHOtDj
         d0gYTI3T6T1XhUdIe9l2CaJxzTOqosbqwBB5R3Xq2KHvWWZukrZfAAGA0qDN4ek7bGn5
         bvfmw5JKQ7fpciK1YSNDaCV0lLlLfi5vscNEK18NvGodF8eeN5KpAim6QG5n4rcv17cl
         j1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869308; x=1795474108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=EyKc1fShWL7HmNH8xieZDuA8Fx1lsWpDvNo5pfFvjECAHt/dNKG4j1dS1TgidasQef
         ORJOI16Shcs8UplGTDMdx4vS2iMdEoQjstLabdiCpzUElFQKYKdLakYg+BDg9GZRorBG
         0NfaaCAtey6JB57ikHvQzmzG3+mshOYEwhwEnThhnJJLX8LkrpzSR+AOLfu5FzOLbiqb
         8XDDEUCOEW3/qbos8dWfVhCid4SQ+po1yEgTTtxvMmWWOryKrNgpgVjuvM9X9zZn8103
         laAzO2lzbzkd8M0xIhd2NPBjdfH9kTHqreo8B7jIyUk0Q4zfVxaYWRcYAkzwY1YBzPWv
         VQqA==
X-Forwarded-Encrypted: i=1; AL+hErEXtTv9yDKldodc5G6t4iQv3WCFoEbKanEgf9104LrSit7g2kMH+EW++oh0TStnNvYlen0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Y/kEEv2VTMN+RRYp6JOIdKrwjiLSt1qrIMb81Atfyvqoi6ATO
	wroah6eHrmuMxvBxLG2c1nxP98O3/jIOptDlYIpElRVWNVjBWM7SZis6
X-Gm-Gg: AZFdTZeS2nSdK3/dqHnkxlj3jJys56p5BbL4WAi3ME5WNPsJUMTjoP/CJqVYOBZ3qWu
	H7erFJL1aUSjjC91LUqLnI/iSNoZL3D9Q8RMvk01KrXtPvQSt+B/HqVvHHUuGdbEDMFydHvggiO
	ItDmXJaVfZ0Rk1p4inzuxmJxscLjToqJxxWYGtLpMa3G58Soj6r7rYSWI9P6QRfDFZRpJNhFZeN
	6MThg7awSfJziADVkBLMD4Kx/dx9F6W1/APqGQQtyQAlNxMVnTfgEsHbmXxvyutOV1iM2f8exOm
	Q3qM4aL4Gyrojz03DSVsBHsfOrfLm+XPkRPcUVCkDEWmIYJFbmRO1GmNY2FuOBvD88ncFV0dqK1
	vr/eJOU7XVmj8lEdRvDxnP7+mL9rQc/BCYhTIKI4K9zxBkaXnYhq3Ou3oTN9ZB+kcoKIhRMYLaC
	fGLUdwD1ucEq5Og4P+xVPphKOPK/Y9/1OEcSnm5NqEaN2woYTA9Q7PUxZj/ptE4lQFsMRD0HbQ7
	unaBSY+e0HdrKLpRea1wixKoP3XN3vLItjhlK9q31FkOMx+kryhV2QwPpDWowGtrczTlXDCv5Xf
	MM2F/Y00aj6mpNTuHSpA2kilS7J+ysxWjK9AdS99iqIkfzIC4v2fq8lk2Vq8OAMvK0kknAWz8Ez
	5TyipRONUHG2VkDgpRZthFw8=
X-Received: by 2002:a05:690e:d42:b0:67b:e822:6ccc with SMTP id 956f58d0204a3-67d895e5aacmr4455238d50.33.1794869308071;
        Mon, 16 Nov 2026 14:48:28 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:27 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v4 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Mon, 16 Nov 2026 19:48:03 -0300
Message-ID: <20261116224803.61154-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC clock is acquired with a managed helper but enabled and
disabled manually.

Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
devm_clk_get() followed by a manual clk_prepare_enable(), so it is
prepared/enabled for the device lifetime and released on unbind.

This conversion makes the code simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced.

 drivers/mfd/mxs-lradc.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index aa55f88399ef..c3dd2d80e7f1 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	lradc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lradc->clk)) {
-		dev_err(dev, "Failed to get the delay unit clock\n");
-		return PTR_ERR(lradc->clk);
-	}
-
-	ret = clk_prepare_enable(lradc->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the delay unit clock\n");
-		return ret;
-	}
+	lradc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return dev_err_probe(dev, PTR_ERR(lradc->clk),
+				     "Failed to get and enable the delay unit clock\n");
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 					 &ts_wires);
@@ -193,8 +186,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Unsupported number of touchscreen wires (%d)\n"
 				, ts_wires);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	} else {
 		lradc->buffer_vchans = BUFFER_VCHANS_ALL;
@@ -204,29 +196,17 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	ret = mxs_lradc_get_irqs(pdev, lradc, data);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	num_cells = lradc->touchscreen_wire ? ARRAY_SIZE(mxs_lradc_cells) : 1;
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   mxs_lradc_cells, num_cells, NULL, 0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add subdevices\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(lradc->clk);
-
-	return ret;
-}
-
-static void mxs_lradc_remove(struct platform_device *pdev)
-{
-	struct mxs_lradc *lradc = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(lradc->clk);
 }
 
 static struct platform_driver mxs_lradc_driver = {
@@ -235,7 +215,6 @@ static struct platform_driver mxs_lradc_driver = {
 		.of_match_table = mxs_lradc_dt_ids,
 	},
 	.probe = mxs_lradc_probe,
-	.remove = mxs_lradc_remove,
 };
 module_platform_driver(mxs_lradc_driver);
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121893;
	b=vf78/ShrP0Xec2TMzWRR83Q2wStma9f7ONTqGYJqj1icH6Bf7RiBHMu/cVe8mwyTyvj8
	 kG6CLUoaM5/JDs+tordMlDxtbBmQzFUi1gCI6BG7wcYVu3RM+ZrfEAbeldmrJ6o0cqXY/
	 mnTTuw53NPK/Rt1PxQ8yxOllCdSzYJtcdvmT5Z0BO1oXufVjsvtweeLhFIR1L370YkPus
	 NHUKwaycX3Cd3JQC4r4kV+Lo8N85WrqAET0PJyKU27gtT6vRTbftcVDzMxVw97CtvyoJA
	 +9obHmkhxbO7sQs5c/PPkyqgbmztIUiyMHa8ZWKgYpv+qwajBG+KkBS7A5cBKJVZB5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121893;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=/DvVtlbyT0nF+E9JOjJEFEvCJ/30kVZRs824cszDUkA=;
	b=AxUji3G92oHl7g0sccaYbIk2Uzfcs+vKMPPIyguGIZE1SHba66GqJyjLsWLM8AnMOQhv
	 jxkSdsR9Dbx+J4ma5QeGaXJOPUv/gIVSzaWIb8Y6oPzWvNv2L7/ysVcm2eTXtfRaSVOOc
	 Jb0Qdl1Um8Q4SI5EmphRfcHMH0vGV5FMZV4+7blUkQqjqJ33/46C9Up6neaqLQNTnzZpw
	 MGx6EecDaDe8xcrx5w0vjPWb+cpP5jqSZ7ud+19avXZCE2JQPgTUoJiT7Ldx7iVu/yEGh
	 Vl14sG494ulp45sNoxM2n6JEDJq0nhJd/7TIPyHUktnDNZ9C7OtOHmONMJDK3P19CFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832C606A320
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6832C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkc16RtMz5BNRf;
	Sun, 08 Nov 2026 15:11:29 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A87BPej021080;
	Sun, 8 Nov 2026 15:11:25 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:11:25 +0800 (CST)
X-Zmail-TransId: 2af96af0209dce5-4e3cd
X-Mailer: Zmail v1.0
Message-ID: <20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn>
Date: Sun, 8 Nov 2026 15:11:25 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IFByb3BhZ2F0ZSBJMkMgcmVhZCBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A87BPej021080
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 08 Nov 2026 15:11:29 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF020A1.000/4jMkc16RtMz5BNRf

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
and returns 0 even when the transfer failed.  regmap_read() therefore
never reports an error: the FW_VER check in gsc_probe() and the two
GSC_FW_CRC checks added by the previous version are dead code, and on a
failed read the firmware revision is built from the low byte of the
negative errno.

Return the error from gsc_read() before touching *val, so regmap_read()
and its callers see the failure; the existing FW_VER check and the two
CRC checks then work as intended.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
This supersedes 5/5 of the RESEND series; 1/5-4/5 are unchanged.

v2:
  - report the failure of the I2C transfer from gsc_read() itself; without
    it the pre-existing FW_VER check and the two GSC_FW_CRC checks added by
    v1 are dead code
v1: https://lore.kernel.org/all/20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn/

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -62,7 +62,10 @@ int gsc_read(void *context, unsigned int reg, unsigned int *val)
 		if (ret != -EAGAIN && ret != -EIO)
 			break;
 	}
-	*val = ret & 0xff;
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
 
 	return 0;
 }
@@ -219,9 +222,11 @@ static int gsc_probe(struct i2c_client *client)
 		return -EIO;
 	gsc->fwver = reg;
 
-	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC, &reg))
+		return -EIO;
 	gsc->fwcrc = reg;
-	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg))
+		return -EIO;
 	gsc->fwcrc |= reg << 8;
 
 	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,
-- 
2.47.0

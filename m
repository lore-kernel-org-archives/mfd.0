Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797669;
	b=XSTOVdnVoUnJIuoG/n1wlhCw+ZZ1kTlbUBSmHWpFIGD8bL4iIu7d2ZotZiTxWYXjY2N7
	 oQDD0CIqQ6ukQNuoiZzpGRVODfo12qImT9htv11Ucc1XLyXD1ZbIkGE0Rl2ewZGc9ZLWq
	 IBkZYSKhgEeKEOqoopIg3kX3Wa2JZQYfE5qoP5rmGUGBNBdW0ZDOoFmeNBbKQYa4FGvbB
	 aoHOQXUEDv/QBkYu5dakpRfJPu0usWm/jHSkNfjZpsLmR4XttCqagIddnmFhTCvYM/U3U
	 /Tw/itGjIKSyKLzVXtDa6U80BLUIsWU32rv6FSCzYYsejrFXQYoBgRA5wAYz1COq90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
	b=M9bQY1b2ud+94NPSRN2FQz42SqJ9HGvZH+6bEeNhJKOFvUm1q9Pt1kTyq1lAUx4RIiu8
	 wILES//UrE69nGo0W/Ql5wLnrI4tTz08vdONu3c38AB+gDZpRf1k76zSmb7qFQ3VbruR6
	 xEcv5b6jMfKVL8xhHrJnMbIAXeiWOS8UaefUXThlnwpMtqq2eaYb4AyB1XrtvOo3H2wLX
	 qJbPUUYv1RSq0PmDbu8dyx/b46NatVj3GXwWezyxAvHeOr5R64LAPV/ML2vjk/rcPfJl7
	 A4MqAj9ceoQkHzVEUyG5RR0zI80KJTa0/Y4eo+NXSOiUX5O+EWFc8nuRyVRogk30zqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rshV4qDf;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FE606A327
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7FE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rshV4qDf
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1602421766b.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797667; x=1796402467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
        b=rshV4qDfCIEzagdboa68I44IAaTTIfuCBsIM3Xcjt5W/7IM02TPf5tFTofV8YWW3jN
         tho7FNzurQj3CD623xiQ3ESylleTkotiBwtUkCzs6i7r588KU8nNhROC5pbMriUv+7F5
         N0km1pLvv4b5FAs4hC2ml+7j8ikMygO0MzBBTGR4gqIYqe/P+n5vSLr1utwXm6Iy513D
         NQ5FGUmbvR4xn8dU4MMv9mIG1b2XrhItFhq9sG3ggBbvnxlGtlV6A+SPiB6XYhXJOr0t
         IeIbWZhXC5Bv6RFFarbKRv+VbRzStkb1WPr7ff2rrK0OGyMH6+3iCSXK359u20iJl5Tn
         +W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797667; x=1796402467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
        b=alJlKCTVIm3ut4c+pjKxR+8ocnMhCo8/Xot7AEXNkYzQqxcUfYn7eXESilsU7SyvdL
         YLu74uvOex1VgozOFJBbGrxfydp5b50g4HdoZ4zTsSiUAw2GLTUg9Gs16JC8dqofYbzZ
         PCi3oVrYd/yBtGUjEG1RC6HwRGYIhVc21cn25LtsuU2551BmMFULsnluJB8nR90XTy7C
         zrI9ICCe3/kJJGdTCAlCLn3VWWhjINwlKYR1r/ckhgduLgyz8CTDqRhg/XM2lJSuuaqC
         lWUCIGSbtvVBFBz/T4jYZBFjX7OJbQvG2h2mcnjL5zRUhosNLctfrnTQ6/kGIquOeDtO
         l80g==
X-Forwarded-Encrypted: i=1; AL+hErGTbxkK/DITBHCdwosPOsW+NM6rrVfWgpxpq0mI2WHpCahZKnoiG5XLhyoU+uQK/Tc+y5Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z9WcDKcNBpgKjWtPxlbPuRDNZDeK0uzjbOznxeQRh+53TBJmmvf
	7EX+t0mc4ZwPgjjk15RM4EAA//E9PeYHYHg55uv7nqwLfPdRbBLpB4L7
X-Gm-Gg: AZFdTZdZe7hBI01DjliHp0QP4XGDmN2DvhD9zCn9OHvoomMOz6lGCxAozbT0eafIt3I
	xqC8JoWFtgXAAUSJz+tFQYNjv/W2uE9NQGpQroch3tZ5K13bRN9bWKqJfIiNm5FYIRxWXrRQD5f
	fofsdRsCfVV3/WNV6EWP33JNG1p6YwjNpYSIczN4VrSiBhXJmWVMZXBlm3dFPXrP6tbQVutme+t
	g0ZOm/PaNFXuxThAaH3XP0zXxv4W1fd0aYj5t4LeLrfeaAFGJcg/R4aEniJkxn5ym4c8aFtGjOi
	Nqw12wxZvxgEMOwQpVgM2HrY4vy3tLJ8QQJZMat0MIHSaAyGufb88/Ghekk6AXlq8aApBikfW8i
	A/FdcTjPDn6qsNkhJISfrHk/p13WhUBaNakYUIQtiSeNuGXDUehzgC//03A7hDBytUlvViGqn48
	z2sGd2nHz9eeFHJre/C+Sm+eIaHysYGrzBqyx5YFuezShK+/6mCvr+kwnjmEpOKU+Aoyj97fwpp
	zBlSv+VaY9Ko0fXh9Qs61qcQgQCjYltclB7WwnrVM6NJ7ONO6lbZsmun4qisK/MSkPdlzwrb6qH
	SAVznF/Nb7GKStIKf8L8zHaM0fI/rNRPyh39w/z5GCUL1GbYQPpPcMV2iUfHA2wg8TaDWDJ+qQq
	ymt7pydS03A==
X-Received: by 2002:a17:907:9301:b0:c46:78af:6150 with SMTP id a640c23a62f3a-c5131585160mr2353132066b.2.1795797667115;
        Fri, 27 Nov 2026 08:41:07 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 4/6] mfd: max8907: Add restart handler
Date: Fri, 27 Nov 2026 18:40:42 +0200
Message-ID: <20261127164044.285910-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 14 ++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f6eeefb419622..b511c57026188 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -185,6 +185,16 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+
+	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -244,6 +254,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 35b2ede54f856..9865ae52877fd 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0


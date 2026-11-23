Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446171;
	b=tcdQwX+0CbZyWAU07ErTxJM4fg7rvA9nTkKBUZnbS7E0hi1n3OT2OEwx1wWmsVWAbiNI
	 9kdn0BAjlKz6VGEwb49SRZZH4I+ieLkhQPOQ3K+yQWYgccSkQ1NgOTmLSg1vKBv2I+W7r
	 OmUtHyU0mPq1wgOnZ4rkXWNWMD11sxiuZoLnGVySrjX2bVkG1NGhPyEOndDDUKHmdFGmE
	 lfO86h4wBN25D5mCcP2Qrd9uRDtNFLEONctxr+p+LGpMSeO90F7yN82RywCQNX27TqOyZ
	 +dAkcPTQjQSVVUqMcdGhribdTwFb/bbfzabD+SUhXBk4Wl2tPF7e532/cd0Ds1xba9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
	b=JErn6Rkmzx50Ef3fqbB8Ot4tg2PKagVRdMCwRjSs0ySFB8PRWuCNq4FZPh+OWsFlNRS/
	 yKdohbFHzjLzOOxr9NttjH5OKnIu4Z6rDjqzmUh0JRogCHtPKgR/tGa4r+ruIpw75dtEs
	 IQRtZSog9LoTsbTgf9JwQvV+McnYmniaio1ZdHj8Gso5NoBBVmNELGqxCSGNuYkoxraiF
	 yYmcpPKwhuFN/xgYU7uNQ9gME7hJQH9zJHEF3JH6sSzXqDG4Uhv8qf+K3mo/rC2ByXiYi
	 ybrHaH1p/4Hldh57c8DvscpCRcHpmVlRUdd3wWMVF5lQTVO9YWd2jCOcyKndPR1tv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thMDPfqL;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42786606A6A6
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42786606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thMDPfqL
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so647161966b.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446169; x=1796050969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=thMDPfqLoj+mFM3Fw8WULploHJR86PqV6tgetESAigsIVQRJpgwqOkeGqD01NWwtP0
         5knPN3VhZU179TCkFwlAKP1XwP/o1YLhTCtTV4yQPLUNgYefZaSBgZmYBM1r52ISPvI0
         xYtNmjwDzfcsZy1QyZjRq0blWABkkwHfebXfCOxvw+K692LdEw//B+UKu3N28agNCqZ9
         zWCH3As63SsnzjqyCJOoRIz213vESuzVmi9vznI0LA1G6PRdMvfYoXnGl0CeUN98jivb
         LaPQpIyk3F1slTl4MPmuocoyXtRsgmX0CocUQyw8x7CgTz2/pyGixy5Dh12mmVFaCR+C
         d5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446169; x=1796050969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=XhmrkGBRgPsWirDk7cgxgO5X7cy1m+LHAUpa5EJa8qs2EHU5TnYV0SA4DB27vQxS4o
         br82KlKQjKuAnAhGGPgBJQF5xAjqu13sBNsCbhZCXroXLPL12TBjbj5CTbRbSL2kaZca
         Xsc0aCKBu3+flRne9WLCp0qpSIbKkCMHaJrBj0pj5+sS1EPwdh8jnvpqZlSxVntoTLYJ
         +zmMtQ4lYG1XeQA/OexeXNYmOPyBFWV3PBp5b1uZJ3PUGrgt60UucfTqZIFU+Gxr7WcN
         ARJrcT+fpgPvwEe43rs/smeNPhwqODS2btIIJhouIoVPzsmVVt6NqqOXbJUiJfeIyH9g
         1PDQ==
X-Forwarded-Encrypted: i=1; AL+hErGYvjDrEdJcCoFi1Rfq3bF2pQD1RDqDFwWh0xm732Eud003KH2Xy4pxvm8VHsu3gBjcOMk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8+Eq9nMd5yyG2WQ2YN+OxKN3bZ1mG41CURIeeDC+6Chz+5f+Nc
	FZRGQcJEOkgnU/GtQzjWBupQT9M9vUwyFVVHeTJhvOgp3NCnMMk0U2KH
X-Gm-Gg: AZFdTZcQLgG3TxY+NfhvAe0d7n/ri9jZChpsBJtbCY3kUefeM1quLTvBA6cPcBLRh+N
	ERgZ9bj35nyG5ai29GKL7/SSDMdfzvi0HdyEk5G0Ch0MiICxsrvZRuVDIJRCJwDCKJOJ7Db1mui
	ZU80DAlZ0CkeXYkv/Sz89rqD6Ya+Tu8DmVFo5GaeWb0yFMu+ovuUwNZSjNuHM0TE+084qQ4pqyU
	dR/UdW3rsJhpGjCvWQ1zuPqBS6pbBT5ICM5L6dXeEbylu86Iqn3UwXTsYcu8DXWPEaaOhIuKhCu
	AXGykH7fSEMf72OiXEUE0mPxEX/IlisO8j3YndiKrIZQYub3gUNtkvgzZTt3eaU46jgDLOwk1Zs
	vU5bse0AxBmqe3mn2wihJmW0RtvzV/GN4+ZPJwz37suU5/iiUpIeespLUhlMgk/5b6wL590RurQ
	4THDJoBTkq6CQTeH1f33DYnrnwdnAdC34HEwlHnJ8WBdnEjliDtflatv25w4Um/spiQU5yv9Fx1
	swTG7iN5u9KFymKHaYGLasiXoA9VNSckJ4QhXJPElCruWZyd5zhphIK1Ie+c1iL9ZEu1OMjnAxm
	SyN18f8zjD6X1W6peONUUs7vGrYul39ZZ9Bfsvl6Tsq//n7uaYBI8mVp+JLyGoyJyKXQR6lH6uk
	GUx0j0VU14rs=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr574859566b.1.1795446168301;
        Mon, 23 Nov 2026 07:02:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Mon, 23 Nov 2026 17:02:23 +0200
Message-ID: <20261123150224.199601-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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

Replace devm_register_sys_off_handler() function with the dedicated
devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f1cabb666d8ed..5d17971a8e9ab 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -189,8 +189,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -241,12 +239,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off) {
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max8907_power_off, max8907);
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0


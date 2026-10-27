Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114695;
	b=I1Fh2gCGSosuFQcl/ILy5o0Q4hwEzhuS5C1N42BQ3b7UvjmnZhI3OqxJ3K4nyZL3vq+H
	 RdsksxU3R/nrvmMQP/UDPGFrwNyvuGnEEuheADwNw6AfJ8GvVQlntjAG6a6PKdtNh6nK3
	 +C1jfL+2Po6JqllGZNZlVbbk8DLvkYSX8QXGu7W/ZH0t2tiSVIuC/NAafD7VR5wuKfwgE
	 v0D5La6hpgpRUZbwCnIbDY6B/d12VHjFXwwyN3R/HP/gUdaFFgTynFuI1XCjLVDugBTE4
	 AqdAfvEK380oDT+YQm107d0Dz7sOpcelyZ5RyRU1I0GY7hbL8YF4wQ/cnE5PQ1uUEiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
	b=HBTqWkdcnYY41N2Eon8wXjyWmFvUCEFunNe4jNGhBWo33FYWaBGLSyU065k8PL1e/afB
	 DgFoEhdEXSlK6liDGsfU7HLj77YhXKJpza4K/qv930EkxG4M+ooIld4iaHmXMbBahewqs
	 wiISI+xo3CX7yAeyaQJkA6FofEamVLVCzcm/okIw++EdJwMzq8ejtbRZLEcqUrkCZ1Sp/
	 QwHBZSQadhSzqX44W83CGunlQiCYyuCM29X+SscIuuOmBJSXbJi1UnDJ8IwWTtJGABGFJ
	 VXIFIK4oRTvV3wOuCp7zdvCeRmTnTjODx+pt3T5AOlLMopOM6JFmYr324/f0u/0y9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zy04aziz;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3257606A31B
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3257606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zy04aziz
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1869897a12.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114693; x=1793719493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
        b=Zy04azizf5o2Jluf3s5ezCMz1J+UuS41aCVCVIQ1qp2L4Y2V7F49YwPGVsikQS0nOX
         BbzCQmQFpeYJYLuAEfsYKx6+07ldKBa43hIZGedQb70P6zKDlR5IWik5ysraAebv/18g
         fUWpvnBsSKcxa0BLjQiTudK+Dwws3xLs5c504NCwlBkztcz9Psf1je2uhQu+e/JxyWsn
         gCykg4hOwi6XisX5FUgpl8iFUcknoF6gy15m9JDKRVMPrHOeajsxP1VlVXAwHSZf6Dqh
         Cpj8hzrMvJW+bCdF0JlXkpBPRA6qU8mroOcABEuTfZBZHgb13cnsD1DHHexH09ItqwtU
         YxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114693; x=1793719493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
        b=YYTGTUYQ5J0aT5DgePXvqzhSDzwxrr/x/w6Pmfj+/r0uoAqt+WRXT7LZxlEWXXTnMB
         GUNm2TpyL/uH29RuTWzfZ81LulUw3Y8mcxHcIofwzC21eidv7XmLKhiGkPwRLOE6XAHX
         9dHGOpqthi6LV7yG0YBLPVMj6OuQK4nHBhnyGp1ZOQCGbxsjkMmpSdnkMCdxGBB18N3j
         X3mcV8vYRedEn+C8hqZ7JzV8ZnJhDFNfron+cw0N9wZG9fAzf+30E/J1yFNLQ7WoJUrJ
         f17CBTpO5sPDDTWbP7cbRc82kFpiNCcZGkKPbpf6IVCY5gmV8DthBzyibwLEVg8Y7ct+
         aFVg==
X-Forwarded-Encrypted: i=1; AKwUvBzcdJHMI3A4BqCDIt4s3q1yGAmvLiocjFolU4vjxmrfz3S507Y8LJUHb731Xp8Vq2EjZMQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYIi8IHNgJa4Fw+LlaVoRnbb4rWeikGiTK7gwR0S5E+XDLUKcV2L
	IF/WU2sfTMSPOl89iP642AniWh7gpolekMJnJGX9+7gepFZTjE1E8juq
X-Gm-Gg: AYBFou12h11CR2YZVx7oU0q3NOdULR89vZ0Klagk38P1U7W5wZMDv1mvHWjX3oh3wiV
	/i31u56DSBLBuRthVKtkBUxHeqyzPspGChraAZ/rEDg5l9F8/SVL7wy50Q5unksuYEJQf0cdUyJ
	MN/0Cv669qqWrNhrIMMWG0XU5MRIK0HVSKhE29S63fif+c8Ac4gji0BowudQxL6La06BLoJm8fS
	t8+Uf34XA+A1w74e2UkY7YuJJR1Y0I9eBNHTaIoWcs6NQH3tfYP6iGuUAeZMB/oNO4yBo9doRF8
	XAPg+ry/4Yyk7c6CvLRDaVCNhJCZ/sS7kR/sQFHBNmJP4KA+BQnZ4vIqCA7tGd8TGyd0wq+yswa
	j+2bW6/FoUQypTx363OT9/Xqs8GAAJBIDNoy1kwllRwkHgDTt4NnoAWI/wP2/Yihc6YN3iFTR1Z
	S8an6oTB7USf58D5ImqokHc5Y8h8sniYHlrIU4ASLewdA3/RIzgY3L1svIFgFsCLV6ROTxhojaB
	RVNFMUO3HCtb3MaJRtFZ8RJ4mWYtndhOYI0XZ36GhvozZXtAEBWCYojfwnOK1VmlgMLKaEa7bUk
X-Received: by 2002:a17:907:7b8b:b0:c42:4f89:13 with SMTP id a640c23a62f3a-c49a73d41d4mr297034266b.15.1793114693026;
        Tue, 27 Oct 2026 08:24:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: tps65910: Add restart handler
Date: Tue, 27 Oct 2026 17:24:22 +0200
Message-ID: <20261027152423.194794-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
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

From: Dmitry Osipenko <digetx@gmail.com>

Add restart handler to reset hardware properly on system reboot.

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 97855bd9cc3c8..ce7ecba504b3f 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -437,6 +437,17 @@ static int tps65910_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int tps65910_restart(struct sys_off_data *data)
+{
+	struct tps65910 *tps65910 = data->cb_data;
+
+	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
+			   DEVCTRL_DEV_OFF_RST_MASK | DEVCTRL_DEV_ON_MASK,
+			   DEVCTRL_DEV_OFF_RST_MASK);
+
+	return NOTIFY_DONE;
+}
+
 static int tps65910_i2c_probe(struct i2c_client *i2c)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
@@ -520,6 +531,12 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 		if (ret)
 			return dev_err_probe(&i2c->dev, ret,
 					     "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(&i2c->dev,
+						    tps65910_restart, tps65910);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register restart handler\n");
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0


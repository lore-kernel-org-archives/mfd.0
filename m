Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733538;
	b=F9mf/xhiRXJprX/O7c/IHL+0mR+1sDS2eR8edNr47b57XxjkhrsQ5bd/1+tnV8cSX1Do
	 w1vPMuui9m9MSsgBQ/DQmlCqcqaFAp1szFlI2uFEDIlkQhNMwSFj/FALN35nEu4RFhqoc
	 Rc5ta/KSVDsyBcpjUhm8x2RldYVzgZKImSx2+vh5yVqciTRaYdbI44YIq8nsUCUWSiZ4M
	 xwCAJgBvADYqYO7AJPxD64D6tvM8gkFl6ZfrtwojIAIeVRbetBX3Ec+mOVjp6sTHi56cg
	 wINLdJyJ4Ivf574dkvm3mSMaj57/363Hk8znqlDC4RMJW8Dr9H5PKBIyYfa4UczoZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
	b=O4Ez/MIzINJ9FCMB14NQCYQxsPfSh7YkZrjciizDrtNl/PXM17TDL2QZE5+CXyWWOWx2
	 WOQ/8VvgshzpcI83cTZEQhbHBMSqLjZizO14hLBgmBpA0wNArN2BFxV/4lOJbDV5gx/pm
	 PsrkCLUVjXYK9jhmf9IedOFuy1ENfEN/p/bm5q55UoqXaOA2wVKK6sr/75DybF2GWgaak
	 5teV6MgklkCjXUSVhjY8Oqc5N5DQkw0u4DunCVw0x+UTS8dBqTO/yAB5NTwskuR+E5ugZ
	 ydnv2BngvdFSrM36rmY8+EsZmgtzKPYY9NQrhFegeBUbmL3ZCQG4AJtEvecesliO7zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vcw1fA1u;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C5606A8A8
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94C5606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vcw1fA1u
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d473cfff6so343106566b.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733536; x=1795338336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=Vcw1fA1unfGxqCV4IcqOJ6A9cAF1ipm6IF2WRrKdUMcgs/P0vy+Gs0EiRiwGT5siCm
         bz8CqHlb3IRNCLWSPmvkVmzKNfnpf0kXKi5WYVttiwc9HYo2KKvvm5UAeQYDFhPmYIM0
         +yIMvXNOBcr86VQCqT2m3FUmiiZu6uk5BBwoI1bdBWFptMII91NajUMmlpGxFPpC9kVg
         EKPIuPjIvkyVlTwvJA+nso/xTjjHdA4ERNJe/BPyDZ0uD0luCksa/CDKtkKjOEw486YE
         wLLamXCfFrIEP2t2qXwT2H0wTuDCD1k2SpagaMoGCwR3lhV+iDz1rL1bxUBTxj4bTtz+
         7ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733536; x=1795338336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=y7lef0DrdlMsDybqBU06SWIqDnGUQ76BQlfsEuaGhawj7I5h6iJlaMkNLtxJsm+gYj
         VZ2Rsany8s8GI4saLQ7C87cNx6AZKGMLEOrUH/lKvTPxHB8sjCxqMlM2R+Zn2TUzjKhd
         bv5bXuuIqpjjtpfveRZJ79l8mhOfBW5zvoiRkHLrSL8ocFm9u1NDrbJENR/4v3Ego8hD
         TsiaKrdI6iwZeOA32S3HsTuO64x1PKJHZKiBUP1u7idXUTd1Y0+7sas1UPftSzQJjiQf
         7aprkMyuVAmBcvWdepmBXb4iF4c2e+z18jl1kGVLGsknWcHBYjLNuTTnWm4SB18+lhMy
         T6Mg==
X-Forwarded-Encrypted: i=1; AL+hErEa0ioLGDhswjIgWlpHabXQkkHNbAb8xf+s6j5UuA/OtHnjWzsxYHFVeoIG/eInz/ptWTk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+yDGgE3JlaHXPuXsp8gl/cKngdVIc/Y5fL5WwiS+K8Qxn7fdTY
	R2D9wn8uh1dkTjdKjjMEvHlP84cHVW0jZq/GjZWNRHYiO1+M/eyiLh7i
X-Gm-Gg: AYBFou2xFUjNSRAomfNbZGXfFIvA4gYVRlVRYiZCsHNmbOErbbEuD/GKB11qLsxTFSj
	miNAIMVg1v3u/wuJ+/rNUlgaFa7D7ksN4LAhnH2g/+6aRtyZHhv1RusT0kg9oMCV2TPXcxI4o5B
	DN+g3ZVOtYw/EQsjWRHFVAqtSiuhV8K9tGhMT0EZIsA+5uyKTmsAHUD/3kfm57/jHbKXjUcXmN3
	CNLXhRCXJ3nvhytfDqVnME0Dz+tJfSpgILBiyvzBy4ZGB1gDVfbmYycLigHajH+HEdQ37mHUzgy
	CQHOypG3/7CtDsFI8rBJlbrduc61AkwRFjAqmIjmc7I7tcf0tBRi0bTYnoUVLZZCAvq/nX9Bt9H
	fHAGIsLm6hsZPabj/v1y8yZwIjgCS8jHsaIosguf4oTM0PDeyxPYdFDX18VBAlB0tkhrcUDN3ih
	438aF7XEFNB/SRnUktIZqrUGExKdD+xsx5j3YnKRfOMUSm/Gjg2eHozXEAeDgNcrnxmVeKSLQGf
	44U82y0A8+3NkJh1mSB+nxVb+OdGvbeF9kX6cphs1FD6iL6Q/hptY4Eub1gE9Sv1Uyn3fMcVYur
	C9mBiMD2Rh1Zr5Ph1kzECQwz3yfN4RylpfwOG/fVqIRV9fgIeHFsMDjEN2M/RMGn+1LREWvCLhb
	U3/I1OQ2+Qw==
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c50963b6917mr589522666b.32.1794733536111;
        Sun, 15 Nov 2026 01:05:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 3/3] mfd: max8907: Add LED cell
Date: Sun, 15 Nov 2026 11:05:20 +0200
Message-ID: <20261115090520.102216-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b57c497334ea6..f492ade8e4cf1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0


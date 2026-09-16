Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE2C3ACA46
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532137; cv=none; b=mmnvvrOwIf2hCcmY6l3U0xTMfLPPDVy64rF8/kB7ibjY+XBg3HW3sL4MX1vfpYDeQsqyn9NhkBc0etHvx654/eyCssAwGZ/J9S5m3wJN0jkHI6PO8MVCvHtlg8vKd4QhT0QQEsPfvSkSByur2ICEWgTl7kZWDUUsgcFgIS6mLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532137; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvigHVMspmpEingg87/jiWL6T6I4oQzGucXxqGEMAI9HPYT+/hKfsmhlVak3V8SriEHZQxNHP/9XJlGhTL1vD3Kvi07w/NuwK6sgM/4pCqM1Ev+LOFReHRq5cCRKobnRGrWv8awhkL8GOHGq0fhSTUKb6buPsV6I/T+CVNqqwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdBu82BY; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdBu82BY"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7f748fe2947so2232292a34.0
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 21:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532134; x=1790136934; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=cdBu82BYeK7MGMpa7JXNNAJA8bXwoSvGp0oKdzKiAUOQDLqRhHRkylODQXRy8B9r9L
         z+TmcPuft/Hy9NvNm6JoG5e/c+nup/EqLsrw8z4ohalTHc6lxe9WK7EU9IRrTJxsqFLw
         49/zkmvuKlq5fCu9cP4D4LNYNcO8M+pKTWyjFwbRnroJdGMV+mfwDjOulkJWLb6v0Aui
         T/nlzU8oIWAlqasZtE6TBEoRFaikmTk4zkFQo+Z1u6S1ze2zy2YFF9b2ijeQXHIaukrx
         11u/dZ0Qb3ifLJkFwbBRfhf15IDDvKaVj+nPuiDO8I2LCFJXugFEKwBdSqGH39xU/pzX
         IDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532134; x=1790136934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=jA2FPVdDr1ipchuAjPnbV7Yqkcaa+wqSMt/A27qrQq898LTDRb7JqMd3FQTCVN1x+Y
         fjveoQSicXWHa9SoM3mR8UGf2B1Z+BnPPDhn7lDPpU9QdpaEODa7NMXD7QIeZvqfHyHJ
         M11mHrvLKCpLcPvjxgb99Q3J4Jg4c2kPBKk7LT2Uu950gMdjfaw8Bgv461CIlqcvOBMM
         SPJgfp3k7j+dfTrzT5de0vEiqzUzUcjn4M+j9omsUUEg72kHEJgsJdx1jDXKYnSvEWvm
         ViUrRscPty+dzRPxPs4Xg55X+p5UCAsTq1jyZNkKknlP/ugG3k4yRcMMYWetJreD/DcT
         UINw==
X-Forwarded-Encrypted: i=1; AKwUvBy5H224AAQGawuvvMdCBpT463Na8+l3cG9RG+9B0q7SaZq6rZK+Ehi0WsNF22vxoQKbA2E=@lists.linux.dev
X-Gm-Message-State: AFuF++kRyeUW7396HkOmpxe8ciboJW0bDt8y61I5bRHy4AKA/CgDkeUL
	SRGyZIPgqxau3yrsMHInEytzc0xBGjBzIMi9MqqoUdieIhs/TvuYwhaYxAnhxRXOuTw=
X-Gm-Gg: AYBFou3nL4syv6hnGmV2+3UvVtXeLawneL4N+UcrlzXR4tLM5HpEzVCPoFAnHAFbHoX
	Sc/6AzQEY+cRxyWoSVYE99mbaImaB/AMdoryGViSRgW+hKC5Ie5S5uR42otqxzeTXofqaGhZ9W8
	QuzZ/H89N8kP4Hg1XtkPx13mtQ8sKcaKx9/6+tO+DijGi6/Hkk+7DL8FibIRsf9S66kRqH9bLyR
	HrdwdIj4Xu42us/mEPPWaot6/D4mKkkqRVfHDSeuvcxiMpeeChgMyikKmVYiFCrAxfjL1J+iWIM
	vE1KnSTB1Re12V33MfZtzyfyzjdcbLqeFCDAyNfkPlNChG0iTAeWdAkCxDsluqYOAKfTXZBDSaz
	ZDKci02QF9TUTwLndebyAYcBA9QCP9F32YILbGU8ACwcm67dW7qALNUPaPvNAj/OB/5AHGJTfXj
	I1TUWbjPjqrjiVozFh3wRaXg4Vvzr8zrk2T8+bVgBqE7BOUhC90DKYmx16qpGqlwxeExg=
X-Received: by 2002:a05:6830:a257:10b0:7f6:8bfc:ddff with SMTP id 46e09a7af769-80b2cdcbd2dmr963693a34.5.1789532134233;
        Tue, 15 Sep 2026 21:15:34 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:32 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:28 -0500
Subject: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=Qdf5f6KxhlBn6zznJXIHm5ylt2/6A7HbBfAy+GlK4uGnXRE5GEfZMjssKRRjN1v/McHSPhcj7
 o1QFlFIYqhHBqBAzYR+NCPtMKgwVYgLdEInxZcyBNZ1KMNPGeCtuh5w
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131808;
	b=5Beb9uOkcPVNE/5WIpK3gmxfg7zTMPl7u0XEXLbDFwI3FBWlLGPR/FYQ/RHDgA2iRBzM
	 iXxtWFhtupTMven/Mjll0saStuRJpfUzfw+d5Jm+umzIvUXJrxRZUyRelHn6GA9/Y71Hw
	 CZnEVOIg2BbdvdO02+z76sJVPHNdf/jFmRb8AoFa0jcnl3cs8fvsyc4k9+dZ2XA5er2pK
	 LBC721ESdLzlt7BdEWGL8E2WExyi4KhTRRfhGahMxoqZCoHIvMR+2jsRmJfCut0bm7MWp
	 97SxEEBzde6I6byn2VJ+tQ3hx3G06WATgD3G5bKjbydv30Anv72DbOHJPW4tC6+C+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
	b=oeCe89q6SQmYZ57OCo0owFftY1jZwO/n2Jgi+uDbpp9Og8XppkQBvcO5oaK5K87/EVuv
	 LYO1119gRjGsCvCDpQ7MymZHbcixvldYQdMrgCYWeei8/G4TKigmMhlbQsbJUwh2B0DtM
	 XVPeviLnGzYrEVu9Q2VvHlgsX2kS+c53NprLKfPJ90Ame+68CzpVwTwpaiTe85utyW9nv
	 ajaPYsU3VljHRZfdXgaNqf7dkvrlIfencRKiW0WJ6hMxTkCxSiZayb3+yFw0h/jkTBtFJ
	 7meSuvm6R8L7R9vqbju7djtk4hNQ44wkvqjym2t8BNkWAzhucrpUNbEECZalb6t8jQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOQK9YCt;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04AB606A321
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F04AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOQK9YCt
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso2249166b.2
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131806; x=1794736606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=TOQK9YCtl1yu/zWK9V4lfIf3/9yGluI0f+zJOKBgF0SE6syKJ4FYZqkLISsFAm4OXw
         mIT/eO5J+qO3Hy5YTD0R6uVrCIP0ob9iyHzUQz3yYjFwMxivHl0APw/vTqbBjF3387QX
         YmEQsSvRgxvTBHKKPGBvmc7oYXnXSBn5CRZ77tjMeSBHYJHg4dkqyTZUkprrnpdkqD5K
         Lh1Cvx8mDSZm8KmtnwLIM9f5BOQ0AIiK2jn/PFCuKHbBgX7pJtzR2BnBC29AxpBXsJRo
         fwpT9ihQOdFrnmdt2CHIORn9iIZbZrmebqdKqZnp57f3cKuBaPcnMOuM4wxFVtRh5ZZK
         Rqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131806; x=1794736606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=sIh4Gdxb2pAT8uAkFe0cdOTxKKAU0JevWAG+XI3XPqC3X3Lw7FDrfwRk5vD2y626Qk
         0JJui77H5+S+uD8LizylcbGMIV/MUgyV8aXR6Vkb5JESTLo/iSITTspHBO0RIm9D+kUa
         vpERUwX6Uyx03Cg+xfrJ0Pu2vDLd4k2ijwj624jAcDzG5sO8lWJsT2oo7i13RGyBm5xi
         UwfcNPmROzXFMQEFjlNob1mdJohzL4J2rK8k6edVMTfWc5kplQ12P8fCbdERLB0KqL7d
         dbW2Ic+6IKbY2x3/t0pb4NtdKJ7GMH3QAc78WoYFS6faqAUj+y58thjzoxHyoUt5+EaQ
         OItw==
X-Forwarded-Encrypted: i=1; AKwUvBw/umjcqE2onaKfwG9NUwHwTf6BWNEPCQBcCNAZG0PVHqW3ferV6bMDkUa9V4RfidH69YI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GMZ9KwjNwSNofBHE9rOBS71OzMzJ7SOCTfJr8BWKBG2pPZnBW
	iwv/ZUp7Ob+2eoRr0u6LDhal2C7wid+ZsbVCl/HOCCbovr98BUEffzk3
X-Gm-Gg: AYBFou2117LoJeYSuGHuRA8FdW/fOFF+7Aov2oe5uoFeKCgE3HZlbfEMlYLQf7w+4Gk
	0MQrdYgPCksNoP21054MCctUc3fvMEhxqKsx0CdpTWq50QiWlgzRo4Aeom1bMKeerWRR0Yp1AOW
	5iQa4qh3p0XTuxBdlQ6ucTSWiftYJXZN5qa9iKk9HG1ahq4GOoMDkG0R2Sg9YV3JbzdQv1ZP0tv
	gxsFL+eQqO+Mue0YMjYrMqK9dqP2SdPAHNaglsHh3xOXWraqPtRIMaxYvDTFJWKAukBAhNRn9+v
	fX+uUVbL3pm0eWaPhjPCZ3jORLBjQUBwIrl3oMHTZGDcYJKtyoEXCiY4yccVN0+VySxL5ie7vtc
	t9I/F4TNAtNE64aJUwToGaUzOZniMs0RS6oWw542MKYGB5AF2I8zoSdvI+Tqcp5olosP0QPutHR
	u8uIvDS4YB54OjBXyiWrUPxUjOqSo9a9VDGnpdBni0R3GBxcGPEoQUKsLndatgHQOf32CUn+gI4
	dtrt3NvzaReA2e8E+Rdi+RG+voXz+SkBvhGGe31hDQUvkK6vZN9ovuvnDy7tZ0qpqe6+rVQTlSU
	/9JtQpA7IWnmDg16LRe9kPJzF+KO8S/CqVS5lUqq/STXZtLaSESMa8TfgIKtyLvla6GY/wT6nBZ
	IzzxvoHrn2w==
X-Received: by 2002:a17:907:da1:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c4d6d35bda4mr86080366b.12.1794131806225;
        Sun, 08 Nov 2026 01:56:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun,  8 Nov 2026 11:56:31 +0200
Message-ID: <20261108095634.100517-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree (DT) based configuration and is folded into the main PMIC
node. Document this behavior.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0


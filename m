Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446460;
	b=HG/SGbf4QqkXYMLI3auBbO+I1TZy/BjTAFwXpMkQ4UrJLMYkqSBaELc6qtNDXentDg76
	 v05SbDjeFjNw1Kch7Rc76Vu2ByKUMZNbg3KvAgNbePNkglsmYeXi/aPzyFsh0kPbnoI1/
	 ewsPWOCZDrtyIqygndgMVKvsfYtEjxRyt66GYyNvz40OLLILmyJFmAFX/9kKipS3juEt/
	 M3oQ5kcPtzYtr8u3YzFYPMZ2D/jhLBs5UYgpnRBRf4zksJ9c2sJxH97SjhELSiP/HwiZ4
	 r6iT4lsNoGXEJnC5+SrshvAMwfYh0E1Nr4ph9l9TlSskzpKudCTj7aFlq3/vVeLMH5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
	b=Yt8Tfx1P/vlVSY6t+PeR4+4Rk+RrcVmdjbhevygGqvOlcjHgYqHN6kvEXmiG5c6bBZIe
	 1ZbF3yEgVrJd7NNz8fJCx7I3pVPD9y6OlDLtIX2FT4BjxfArC0bXS5OXOU6tbHxUjaU3e
	 Au+ASwx9GYueZZaQtntXp3Dc398G8KqK1QvBSbaCL7DFY6pheU5023SgMnOyUHbfjQEU2
	 NedNrsfoViypYycHoJJHvCwRhqVKzryUVIBk9AEVEhXQhUGXnLzXgL8Tc946yz14+T+RM
	 tweWJMuwbYFoL4BcYJ9R1og+W64r6OUgesh40c8fHOXMan6YNLg3UAiurmYpfUizo6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhFO+EfY;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1E606A330
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A1E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhFO+EfY
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so4359968a12.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446459; x=1796051259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=qhFO+EfYMJ4/BJZpGLPT0YpO93V5GC2y7TBqWuq/2yfEpPWXzorvr/0ADFXCKPaaVS
         ZU/gYKsInT8UYoaYhVophKBr3QnhsNJwny8RecgJaSHeDgsNl3kSeO1lW+M0ECTO3N9H
         i764DuBfPARcT5xWcdgxH5Yka5Yayal2JMvaoLF+yfHFyBgrVXFnWijbR/BiMsYb9e7r
         ZdYb7ca4/05tH18kltFB3Q5RurevLthqU6CGWPwTQMxMwC5X5l3s6LntEPfdWOQW1xh6
         I22GQnb1a9iaRFRQOGxbEOpXELjEjT2rRWGlExwYGsAwbjQ+2rrrXuqYT+VN+grDfbg8
         4LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446459; x=1796051259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=IZBT5yG9Quog3ZydqKKohdxOGK5YN4kGT+ramR2A0lP6xQpp+XABtcBVN8c6oCztzQ
         7zKN8ICgqjRUR2zfmQdkePd34hCRYQch02/w5/eIlDiLBc/bpeBM9fs3qPOKVpWaX85T
         HKC6NDwb2AZJ4gw7XHUW+VIeYTN7THAM9Rfinn5jPgAiVyOKiyQCw83YOKE5On1GXWhN
         nVajrb6zE+PvXqLfI1/emz2cohhPcuijItQ6j6U4P/YV0oQDfSqS6mHutx3N7+Vdp76H
         5AvFEMGkZ9gKPJCiSS3PbUn/Ai7O0Y2PhknD3pWhUR6BlXPR5s+imVuu6rr/cJB3k0SA
         zl7A==
X-Forwarded-Encrypted: i=1; AL+hErGpYlu2wCIWfJmsDpzdfsSWrBH425vueLize8JRqF6JMlcvuRntaF88JD+aCOTSZxPUuHE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/1T9OA9xDxEx0c8Kc9oZJBPJfw3KCjpuW6zUOZrXJ31ticpNTp
	ylIMJQXICUMHitJDu9CPu66jlACQiY6ZegOi42OZNcbRyXyzewG7JPdM
X-Gm-Gg: AZFdTZeNF88EqhpG8DIna4Q+tXunB4MiGx90nVJjCGHbox71LSV7c1RvzysIqW0/ToH
	HCDZdtFaV6/OkomnLhVkwInEq4rM8U7jsWCG2SCR0I/iKHPuFjw9OssMvR6Eb0G3igTv+NtRTxb
	hmZt79t/JoGa4PDmIrEPkzvTVxyfcgrn3JGdRefTya61xxA62KtHYivFfpigX74nQvDz9aKrQ3B
	4hf5Mm6JNKNFg/AOTmfuU9UCDFNxDV2pkxVW0OaH2lHLgT6Y5YoDblK47yEUQyMvEsVUAebNt/b
	cG8raJbV6Y5H3AvcbSijui9WlXbSFYeKRjlM0J1xRre2Z1hEdXs+ex2AgepI4GRviZJhw8myBGx
	6wQNrbMWyiaBT2mk48ce8rtLKDgt5H76yOWf2Na0IoWv3okxAPGzCm/Mwb6s1COdF0HKs4jo43H
	p8KweIPnXFnijEWAGog0nKC4/7AuqTWrFnVuiFUd5N+Oejj5ikKsjTNlpLtGbyFy3hsr0msJRSF
	5LE9javlQPjGCpK53NwsHbin67alHP7TkyfsICn+TxCZrC4sOYNFUYeqrHhhJ86VipZauxpE/o4
	NGq8X+1CDF74nPIfNl0Bxu2joYduUnWlK92FtwmDCTM1d+FnUQXMDu2SYc7fOoxUDoGS0q8BJI+
	qXLmVvZjxDQ==
X-Received: by 2002:a05:6402:5686:b0:6b8:823:9b4f with SMTP id 4fb4d7f45d1cf-6ba37eb1d98mr6528446a12.38.1795446458383;
        Mon, 23 Nov 2026 07:07:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:37 -0800 (PST)
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
Subject: [PATCH v3 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Mon, 23 Nov 2026 17:07:22 +0200
Message-ID: <20261123150725.212836-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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


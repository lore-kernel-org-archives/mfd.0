Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025327;
	b=gVGoin22mMXcpR3Q+lJEU4OLhn8NwaR2qkodNxHnsYTEgMzsbFhau+vINyEdZ8znTLzC
	 gHy6d8cB4cMc6ToyuIDaEnsi/+M7gWbNLrtskTDJJGsBRb0yyWv5v9gWlqm1SiPPheNIc
	 Cyj3+UrT9tfe3SCuWvEB+ezXWEEnwoypMsFoN9vLeYBzce+Dy7YTQVNmCzi2Z0YQdwsxC
	 DoBUI3P1353H/i5LXkqbGyroffAM0PfDNzRab2DAW7l2h58H3MweUFTqCzJxSqsHGSz7B
	 e65YzXYy+tTpgNbhx/uD8GiDv0d6RcqzPr3R0Ylt8n0B4zLXgLLpZfm9EJCKtClVTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
	b=1gRiSrzvEspL25NZlVSVuEtbMfe/W1Y/5RmxIgHlngFYyNLvcElWDUVkAjL2Bcjeu+Ea
	 W6wrKPaZ538Pkeq2uPa/rIeH9oAcmnuK8/kAdd2PqrDx0sUDKNm4VHQ5maIVJAFbSAAIE
	 YSSzNSmEa+QLGLKvFb+k2g/b+g3U6uT29dm0L2XGIO2DEkyTVTjjV+KlPQk/cE4l5UFpY
	 f5Ia/gNGVBpeLcKOm9FQ5HQgXP4N0HNH++1cdGLgRdoiXrhBFhWThgP+njQMNYO9I4EFT
	 Elik49vpZ7OgbAlcGGDaZH1mRcUAo9Oa+x2u50alDW60/XqvzZdkLxfCcxnHqor+NJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ahWAAfGr;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A98606A31A
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ahWAAfGr
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2385655a91.1
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025327; x=1793630127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=ahWAAfGrhqM7WNhinh1eg7Evw5M3lhuUigq4ak2ACORi/Uutpfq91/PKG8cFI3rZx+
         dMYYC2uAhoPKLMoaaIynt20hndbSC3RMfykWdH1OLR510c09GTsCPDI63CltdRbjzS+P
         A+RFez8Ir2Aqs1RydxmlBzueXXvlF4ABXmDV6h3k+Q3sNxSymiALZUwfLpuhWjrO5LgO
         BTMV6b7elIVS2YeM5oqhTTX/SmhoLZYW5pg0nMxM8XK60ZngK3pWT90az0b1RCDcRhfD
         elXRsw7fCw7jZh3FU8EyrZ0q1b2T2ELhq6O6mjsMPA7MvbK6FQlV9DFt2RznFC4LMH28
         quBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025327; x=1793630127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=q4jVgdSDdD9WjMkUx6U+rh/jV2p2Q01cGoOjc6wVgX9agGt2Ysa++lmZLhOaam79nP
         XQY9rVzJrct6P2MJnHUQSps4x06K64VgI1V9d7Yovl/PPaRdiL//OZN9ZjOc+9tLQsdV
         Uo10Z6869trGnOFQ3qYMWXTUGn9nacsVkw+ShxwZlq+3fJGrbahsN0ATZcGh56KWr6rE
         ttux7qfzBm2WRxvLdqPHq86Zvk6dG8ofB4G5ZJq4iemJf1FwmQHwJvnbCGwGSpFdZ2l9
         +GG/3dUxhwExAwknsA2fSmcZ3XDOSM7VzP59K00W6fXqilKR/hyY5drfyKEcXd5TvKwv
         Zq1A==
X-Forwarded-Encrypted: i=1; AKwUvByMUMIQ0GtDp0F74H+Cx3JD/ZXxnylznzlhAA/Pox0+n128P+lWK63JCfcb48nxJZNszDE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLPYgV6jIw+Q77ug3NaBtb2kJaDJuF0v97Sb7sLHUnbtCYkT1pr
	dYhamzjh5ZYFN4a8MBvK86dEMPX//ByduAiHoiw7sbRKnc5CyAcG46jd
X-Gm-Gg: AYBFou09lUYo7N7Kyyu8b6d2Tb8rwVkGMq11Up9/e+5k97yXvE9leuFALgCQRD+2E0s
	hvDOe7B1moaVXb4cOkCBcaari+8gbdhsrqW4+cu7dZ57tf7577T3e+w/+ZpjnB65NXUZCu7t+Lv
	R2culj7GZq4BkbBlSbrH/dj5n8nAAd2x2xhohHZd4NUgpBkv18a0awVFL0LWz/ffWKRR2+aZkvm
	CP4ZYB1JOMTW70EhkE5gUHUN+80qSCNIGXKXVRHqMLItzKhI7gze1TAVCN6v1qG1sznx+kwdqsr
	4CFhxE6QISoT4pY9fMdCrAJOGMVAftGPBNwDXz+864nCww6XPacz+hEFDh9Dle7buli5nLVvceZ
	32ChAL6UFGRvxCgLSCtnMN1+KBn/xe3zMwlUrWQ85Jjc5d8LORDEnLI0AYg+JZjnueSLXejUPj+
	xFpKepmMwFf3j0B7RZOrm6aa4UluUzk2x+h7GcddTQ6eJVFV30kMerrcN1GejMNfeBpJqdRZYGH
	O7rglHzKq2nzRSoYLyL2+JuhL5CsGYNP8hl+MHOJDxBuKoYHX9Yl9rU4JtHYBbSNQfpPTk=
X-Received: by 2002:a17:90b:280c:b0:3ad:818f:3daf with SMTP id 98e67ed59e1d1-3adeac05c76mr5804256a91.14.1793025326567;
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm9259927a91.2.2026.10.26.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
References: <20261026003918.155321-1-pmazzini@gmail.com>
 <20261026003918.155321-6-pmazzini@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>

On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> The separate hwmon cell enables VCOM at probe. Report the temperature
> from here, as the TPS65185 and FP9931 drivers do, and under the chip
> name as they do: read it while the rails are on and return -ENODATA
> otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> hwmon driver.

This is going the wrong way. The correct solution would be to convert
the hwmon driver to an auxiliary driver. I am not going to approve
this patch. I am not giving an official NACK (yet).

"Other drivers do the same wrong thing" is not an argument.

Guenter

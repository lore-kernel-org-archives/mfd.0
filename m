Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C17175A88
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041257; cv=none; b=vA+1fuIPUiMet3LUdPH3csOXtjgZNHy9m2SRbM3c4SUhevTAyBLMDzGBO6reK9jnQXyRaNNN3fIfYWBH5OphNiIjjlWbcMiUYH1qZQJkLFLLz34SmGfcdxtuqEblYh8guZdaZ8s7xP30Vu9pRQjQFTxM/zookFilhuPmF28A9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041257; c=relaxed/simple;
	bh=G8P+y1KOAQ0sMjU5M458bgZf/2vH+0bbDZyvKEz7PMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNaOyUhPYdmgeTKFAssoU2c/7zx506MQxZIC2ssYfHS9r9dZBoyq0Z3keCGdT5bNMdTp+RYJqoms05Mc7mECLxhFXTHA5UpDN5rPQvVej8Kb/cEbBP6jpFjD7m5YbgRb5Kk3MdbOc17Jec68vKR6wLeWG9JzU+cRqCJHNawnz7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8BLptB8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8BLptB8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1588751f8f.0
        for <mfd@lists.linux.dev>; Thu, 06 Aug 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041254; x=1786646054; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=N8BLptB8CAlWZ/ljWnxFT1JuNfnC3nJEN7e8+NQwuYLrJKDUKX85Uq4hLm18rUrd35
         tpzsBDngcY7BR4owTNyVBK/0mbkXKxZfjRNhOIPxLZDn8K7jGYq2ZR3Lvf1k9AvEXhcL
         bnBo+0O935xn2rf2GU2o39Y1K3GGWr4zJ5WmdyDI4Z3Z57tnXHQfr0UIQ1LT/HiPGVKk
         XvVj0euz0hgGixp/77HsRyRK3IzE6zOwxSwBHJD3RYEQZQEwGUW4LiRSb1+9xd4AjSLa
         zKEfmUeKvh18LsAj9F+pqA5HSBBU0EpvaJHHjt3TixJs/9Ag8qSMUbv0OaVl4F/17wL0
         Luxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041254; x=1786646054;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=R9cat9ebLe0GoPwq0/1yfzXrWrAcmVFMXK+533mtEjfYchOdtD4r/9oexmJspQJA8d
         vpBdpMLeEx1+WPgUxHvQHoUrqOZBwcBwu0+ZzmUMAewa4dL3HFVZEDaK6y86C61gHjb5
         4gmVvyyKbLR8Vs6YJZI2QH/QW0hN8Zqmf57juEC9aM2hOl2ooPdmRoLe6RLGpEn6eHF8
         sKIdliKwniDiCY+6J3luHtbP+1yZpu2+JsQP5YBaA2oNwPaqMj+KqudTcPxrxTMML+S8
         o2yvNB3ooSDlYP9nppS1t/Wo4mZkF+AQUnrKyNdSmjY9bEytbOcVS/y5AQgYk4MoGloG
         1+SA==
X-Forwarded-Encrypted: i=1; AHgh+RqzysFgYfmvhPzI+RMsBqU3MM+DZuQdMcFxRJplA2eoErWqgQg++j/lSxZvewf2yb/1TcQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp4A+TKSkwh69WbzDRV7Iiu4aziEMt3YcAHyFwwXhSSimaLJj+
	CE81V/Pjo60QTMEou7WGSV2KBJI1OdbvudyJFBit2vYaX9aq55iiM3Pd
X-Gm-Gg: AR+sD110ZLlZqRbey+WP8h81/BFmmj9aL1iRCmsFQP0r7orcTC4Zt9gel6M93jxfn1S
	uw95GE+3RnofkYUmUoIhCSAeTo7Jx/cChWzSsdgA+QUZzdTPMW6Cwvar/BJHi3JarOCjxmkcI1y
	dVhBgBKr2f3rtES5jIozBBdOsNzkzfRQsfMpTFcmrZyDyUNLrEk+ueIMAATHOc6VcvU7RFhjSxD
	mG2vC76pJQmLhQJvobpQPG08Y7jCp997XtVSzB+0EVc52eF6u/aMAPThHdD9S29gmKFjXik9dzo
	y6DYA2Xn7Aiwn5XjPvt4vNLXMtRAFsvuXwkONug7oy6f0LoDdWXiC7jSK7kCOhVoIghYQpAAWJf
	tp21SVCrrKypft+g6/zJKnYQcV4hkn827FIhVPmQGPl+8HLo6DtZ1aqiBD+3GWw8L3ijjJ6V53o
	zDLrtEiQysYYXyDbPugmBHMuLGMevDKw18n14KTcw03KLhnWVwr7pa5oTqiE8P3IDovuhSxPJDK
	EU=
X-Received: by 2002:a05:600c:8b17:b0:498:14d3:562f with SMTP id 5b1f17b1804b1-4994e7cb3efmr202318785e9.15.1786041254074;
        Thu, 06 Aug 2026 11:34:14 -0700 (PDT)
Received: from silicon.doe.home ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a3d1dsm14165e9.3.2026.08.06.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:34:13 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev,
 olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, robh@kernel.org
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727184155.2F0A61F000E9@smtp.kernel.org>
 <20260806143103.GN2869284@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbZ2Luvy9Smq4ikTWC0Dxgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 6. August 2026, 17:31:03 Ostafrikanische Zeit schrieb Lee 
Jones:
> This is correct.  You must not pass one device registration's (MFD) data
> through another (OF).  Use a defined integer instead and match in a
> switch() statement.  There are lots of examples of this.

That's what I did in Version 9 of the patchset here: https://lore.kernel.org/
linux-arm-kernel/20260802-zx29clk-v9-4-d05530d85d28@gmail.com/

Though I did run afoul of the naming rule (my enum has "MFD" in it, which 
kinda has the implementation detail that the driver is an MFD driver baked 
into it), so I'll address that in v10.

Cheers,
Stefan
--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp005IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi2E4QAKy9v/glfkTD822DgZKq
qPzYOORWeaxqfAwwJsjuLkZsEMRDinOZMU6NjOgjam5gH6xFW24xOdsdphnttZCS
PuzRThxDv3kudLgQFG9NA5k2dZ3DVolJBolbNDCrNSCby86zJB/PQo2i0rQe5Y5I
KjnY1/NfOu9eZsQjIYdUSGibnKLebz3FdY/KrwrobpWranqBBXTG2PYZPxtOaTsL
NvpHuzg5X9VdwBMStJGMqowPrGawDzbtS4/P3AWfVrLA9hcLsleni9Dopendlpnk
AyEniQSQ7SnicAeFnutaZfD4q/E+RpaFJejoCmeOnOdDcnJ7SbH0mEoHQqjlz5TJ
hJDo5PBAjLZ3DmD/qOiXFN7UhvMHtDxUEm6jA/UKmOuu/yFQ1zVIO6z8Y3mqYwBY
qDNXuOZ8UN8eZvC9kWDZ8phcVejRJt/YdRG9WNEkZO9pGH0kIxjBWvRcYYgTBWhY
2U0CBCr3lyEtcfsbOL56eJwLbHZinU9zj+B0S60UGEK7frgR//3mGufSaT/szW9H
e1aZAdEiLN677Bmm1DkW+NE16K+QcB6/U1pLyoj+HHhXdOvigOLTZk5wLHBIMBqA
GmEvS+6BcwK/7xy3hGobS4ZMCUbjgyUi8QJaUaTi5k0P6NtQzaxyzmDalcrKWIIq
sCzkCfPHIvDsbbnLIO8Xd2SP
=1FP0
-----END PGP SIGNATURE-----

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg--




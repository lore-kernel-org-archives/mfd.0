Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793387708;
	b=EFHCBRZr9fmo7mdrQhbuRgzrLx5CtaG3o+AEJxjS4co3XgB8g6kh/jW18cyYzY2umVDN
	 2+HW/68zrizIOqFcCUqnehzjwUSJCdi4QnRGRjZqWSSV5HO6Yfoz9SrUn/78UnsmybKxz
	 RUgSw9QKmMalJP33fAJ+GfJ8pJ7buDK/10KYROdPMpWswJSKa22aM7UNtF6UpOETfgDhF
	 gP0Hz5qrVrjkODkJ8x61pHg+devsA8yDgAfaKKufEnRb2Bxs2ej/460MYrATn6E8dpo9v
	 m4ugZats0IHPd8M2tr9ob0JFZKG4aZr7G6spRQvR1lZ8vAdyJOWuGcS9ttfrelml5uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
	b=yACnFYx7J4PkbpwIyDf8ApjlNQ5Oe+BMv6b1DgbUwQFj3Y22uUko+4sEDHpfO1KHW+03
	 339/bFnAmYHc+PO8t+VjAJ+08R8jjEmsqgwatWexRqr5L5tNL938yxyyZerDBpj9w/UF6
	 bVWkzGaxmGdCeHwpoATILXQMUbK9mdfRCFfqLzNyntWpWt3B9eDlqOXxviZmPhmRPNxH7
	 TJ1QyofDS78YQErGB2NoiXsBrS+pdhv9MFwitBegXsiWpQWgaHM2hWA11iyy5hCDv1tdm
	 fnY3uI0LQHQR2PBfEdhRYGlHwoO6kU/DSJCNDzhMKWklRY0Z075YhF6d66ilV6IWSGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvsCbbpF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E8606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 19:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0E8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvsCbbpF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so575017f8f.0
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 12:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793387706; cv=none;
        d=google.com; s=arc-20260327;
        b=sLLOzGyAKshKIoKvlkxktq1E8OZAYre9aAUoGMlAgY78MNmWrtZviMP7BW4ix6VV6z
         nOLGSKV3sz764OoGFUNxx16rhXV47lgr6a0HxlMl5Lz0jf+g1VQeR1ZvMscO9ray67hw
         lZ016sJqZlmpBPzU3tWm1w9Yl5RB+UU/pEL2Cgvx1XQSoKqNBSAJSExKlrZxr31aabGl
         Uzqv/vx0NE4sk0dFdIhr7b9GGXDIH1OqelReuicEIbh+60l1+dWLzgl5N5TpLzB9LI2E
         zk/PiHs95ZxjLXEQg8aiA8/h9kDGnV537LSx/7AK1kMAfEh0EDt/+WvIiZfpiIs1Ythw
         SP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        fh=+fM3cNmQ0QZx7kWdvWe5HY41w+6PQ79XcF3LI/IB5n0=;
        b=opa96jJgpuYVXhB5UjIJILvsyZpMrSzb+DRibDNv2Wd2QMEeqW7y5KGlY7qchWLc7M
         Wv1CHbXZ/gpKDhxEoX7+aNISmZ9t+N4KVCE2by3zAIBc8MXf5CHDwAONjS3PA/YXgLE8
         9iiRZDFEV/bSH6qDovdKY+86jKzNc58JknbPVqW1R+/Y5uiNkrUcd85RBO/2OTVnHxK/
         W/CbQG5Ha5EIJqN/cQ0awktIwroK2Udt4mvFN2tp9Tw6PRA5GenxnKziVV7l55btosmK
         IX8XwiskdA0JoXksRJSefnu0MOl4FrfWVXaCAPqWaJ2Oy7fZgLV01oBBcOEyhrJHOp/I
         E2bA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793387706; x=1793992506; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        b=TvsCbbpFX3yKrRIjC2FpuyD47HKFuqBgoj+lVY4EeqPsp1VxoLc6t5ELZu+cvAoc7C
         Ixq5uSpaMHLLVe3KQmUWT62W5y6ezW6ViDXDJeeN2TpBoq4ZRlrK4OK9UbxqrzYXYDQF
         APT3vbVMYgmdPKPRHue1wqmDbHA2279Rra2FEoWKigb+iAglzyart/4Ef7h2LT29+75f
         DhS+/Shf4CwEl1Deb9Bsox8j23e4EWGVlQiHORrxKtWudF3Egui9zXf/GouT1CacR2st
         X/awow3NjB0uit+xeqexkrNRCtQUJtZVzvhgK4BhaM2TwpNRmQABt1HQFG8rCua9uMpc
         TNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387706; x=1793992506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        b=uEITMWFPMob8keNqmqfP2XqDNn7/uB1/d0sx9fxKqBE4qhsIS5+pCKPse5UrLxqRkK
         BccVtqxrAG0dEOkhL2FoBuq3FmgX6xatkwtYXxSfKZq5MzyUER22J2iVDsOhKE1hID3b
         2iFSM70ep/qEXmBtz2FQRT2j0xS6GuP3ejCwS2piO9JrxvCEL7lZlWu7gskTrg6nP0Ez
         Rs/TDv7fpKn9JO/nkB5sd7Y4ih+K+0ceIM6tiHe+WMZ3gmhvWqFMKk18NGm8F8PUxPHS
         Y7U1b6EjwQFYhD2hPkE1kXb/JjLH6OvzUQ/35kcfgHUkPjv0YaLQUGSS2S+PG+WLRAL2
         gKuA==
X-Forwarded-Encrypted: i=1; AKwUvByFeY/+u66H8rCulDlJVBlST5hDFSI9sapew/XOWuSHBybZvv7sUq8JJ8ZYDycx/34jGb8=@lists.linux.dev
X-Gm-Message-State: AFq9FYL30K0P1V6T8dm38MU5szZHvQjv6IXSfQTBVOBZf0tGnqzK5umi
	nNqtO+jccpMohg+zEXk4ZqDCo3VvpnookWSZVPx8DZaCLyKAwgHWBiNk9Nz/U+CMIo2oTWB5wyp
	4rhITii6gXenXjEvOaGgp1ey11UTPXwk=
X-Gm-Gg: AYBFou0k70fit2FarNww0vd4JahX7EbuouDCg1/cDd6p5cd6i7GMZyAmDK2XtH41xwT
	lVlRKDfHkfPTiERrL0Pod8cBxGLN31+UHh2CiD4i/hbK0KJVdb6FHIZjGZxOo6RMLoce+LH+MRB
	xx2wB8hxARLiZ6Y10oMFrC70AyNHS8hgKj9yRLEJMlmgcqJukYeI4TvjIkYc1YRjL1UyQf/9bF2
	LnZN2JbGEbpY84QnqaNJ1F8+RMOkudYAcHjrOJvpMdTltlJJu3mCmOdlG9L5LK1rqfofi47l1dv
	TR75RvTS5B/SPKoN69PJl8aX7FJ4h/Pe+Q250ltqJEm0R1exSSuR8MPE1IV0nUGbAU1802LmvLb
	SHKY+p1FC5X+P/usFMYQCZAfyy2HlJS7EA7EmOMnKCJCCcbnkHLpprd7O2UK99kE9cg==
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id
 5b1f17b1804b1-4ac182dbb5emr71896945e9.33.1793387705620; Fri, 30 Oct 2026
 12:15:05 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029192223.462367-1-paskripkin@gmail.com> <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
 <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
In-Reply-To: <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Fri, 30 Oct 2026 12:14:52 -0700
X-Gm-Features: AclHuK-AtoT3bHhyOTWnvQUvf8tYIVDrqm_gH-5GSXLbTYj5dOamoVaca_PF2hk
Message-ID: <CAFyMnzYYevg6W9yQzu+DgQg=n1721_XR4AG3104RgaPpbZZwKw@mail.gmail.com>
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical section
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pavel,

I tested the patch, and it didn't impact shutdown/restart of my Veyron
device (it continued working properly).

On Fri, Oct 30, 2026 at 7:44=E2=80=AFAM Pavel Skripkin <paskripkin@gmail.co=
m> wrote:
> Based on code I believe that it was indeed broken from the beginning.
> Also I've found previous attempt to fix it [1], so looks like problem is
> known for quite a long time

So Sebastian noticed the i2c regression due to his earlier change. But
spi wasn't actually broken when using SYS_OFF_MODE_POWER_OFF (as the
code is now); the board still powered down, just with the WARNING
noise. The thread on lore[1] is easier to follow, as it isn't split
into months.

In the thread, the feeling is the approach is a hack, because you
don't actually want to poweroff during _PREPARE. And Lee is concerned
about the hack:
> What's the bet that if accepted, this hack is still here in 5 years time?

The main argument for using _PREPARE for SPI is that it is a small,
simple workaround and could go in the LTS. Interestingly, because that
patch wasn't accepted, the hack continued living and i2c suffered. My
change then removed the spi hack.

1. https://lore.kernel.org/all/20240730180903.81688-1-sebastian.reichel@col=
labora.com/

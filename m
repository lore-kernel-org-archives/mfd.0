Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461017;
	b=1QvPqwSbwDNuY5HNK/WK0X0vybvAdQ0WjjCKN4ayBkC3MYhJyDg5xDtc9X07UGjlql7+
	 KBjTTImO9z76oz6QNMsi8h8GLoJcl2pky6mrTpGP4Q55kgk6aEaBBnI9tIjvH4vp/hMHA
	 BR3LcX4WVlgvtKCzezHSRqrHd8pmNWVhwdz+JFD3wwJOo9OiaJQF7sGjirD+ukYSgUstH
	 BLoY8wRDf+aLBp7FJe5S19viV2H66BLQHyp1CwP79yrzcEM3DFlq8i946W8RJbxpMjDIF
	 smcdAAU/w8pU1vfTYMXDhw1ruW3jqLz9X4gRRzZM74RikEuB8BW2trB/90cW+B5zc0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
	b=DvDzui+Avl1q2F+kvYkUEqC1OQnA9AwIjFH547fqwBJjemaQdZAwp0MkTZXM5m7LiPco
	 375/c2JDkB9wNU29AuVhPLpvLXSCgZcT9erAwqwUDrB010SFoP2UfCbiRNa323nzOy8xo
	 2LAf+pN1sLBCLlv6My4zvHxPKlLP+t8xPg1gqoqnIjN6ug8UeM4Kgqg8b07Pel1ogs3nl
	 VaR8SsaJoSOOw9SYf8AcDKS6qwSLS3s+wllGh9xH/cTOwteO1bH9lvQ/oBEb9GvVmSPvG
	 INrzSv9dYx8fb/QtpHVBjlvMjna7BvR4m4bsV7idz56qvmCIF/+v/JA8zcI75XTlsnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE93Keci;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83346606A688
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 19:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83346606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE93Keci
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38699cf08dfso3674825eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461016; cv=none;
        d=google.com; s=arc-20260327;
        b=eoUbNaw4Wk88cPpLnxyKWbwLQl6DD2gTGIKFcDvsLntC0mRvTaySu4cBYQYm4k4l6l
         okfwZ2er8g2jSvN1v0PO4Imkd788xh0ZXR6GNOcFZbzp+HjIAK6tfyWm9Iqo24zzYaF5
         aO62jm9sDNZTCGGt/rH1Sv9FCBReLOCIE2grqhX+EdkyP3cf/8ahB8cdu3ut5rn/J5E6
         mEKhqtxOZ2tySSlXEFaCM0tkpWmpPZ/gD0BuQaleB1HKAqpsTGdUqStYq7lIcwA6i/1U
         OWChs6wngZ1Gnap1GXV0Sh6rMl9CUhelDsUeGhVjt7tv7FX8/nqGi2jk6KKbgXR/1cHz
         wcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        fh=2fxdJaaVuFV36wZQoCQ0PUaJhpy20k74ySSvAbDrX/c=;
        b=GnzsLGl23x8IFA72gwJXU2MZgZ+3O7g9tnOu9LA4yOQXct45iXN5mmsPA4KP235Gm4
         aKxNZpd4+jRxz/f7lhnDWYrxHfFHqffCCMZvS0T3lWGMCuRckbmFd7SeJx3DJKyN9/Oa
         1FWTHOqtHmN98fPTrWjUbIXM9L1KjhBdxyvhIfpiZr5csarGqGLVpcQA5DZcaK6luw47
         Uo2tlMsREd2AsYekQiwLbecWj+BpFk/mPt8m6SxNmxvIWyHXNAZ7RE1HOtrexR04RhI1
         GCwthKxxGI8ah4YH2E3OJygHgEszae4UptbrmtyqTzmX6S6hcASXV8Id1t0EhkGrUKqp
         tdMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461016; x=1796065816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=PE93KeciIDBGeC/EfyAYJabyZhoKPCOTZZ3vFq+x6fizWXPwogsQBOxowy+lwGIpq6
         r48EDAn5WtyDvdMN3ZViN6iw2Ij334kjnbLipu7eA2ImU5ZLJ07HqfeeGoPZubQ6g7mr
         0WpWgXuoUSZ4z5ld5HPUV5IwHi+VGyEQBj/5yEwQi2A7A0ypbo1VkLwBJjKnBlCTvd+N
         Ds7u0jlDNMYeXdTD7dCZetEyhjs75YWPlVtBwt4vDjXjBEvIfp+R1oXjgcm00W9PmrOs
         7/9UqD8eK9/Cg2LQY11SrVcSJJdVeGSp1YNnzj4ItpfvGwFHYM9JJ5yjw98lRLxm71cb
         kcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461016; x=1796065816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=K+XhDfV3RO42TRiuNvD1F05H2IghbC0EFfJsMEAVPRKtzFPsqDz7//HrM7K8F0aJ0R
         GsQ2H7TCFCk7nzEmn0hCbbc3ZZw1ZrJIKF11qCX+jelBRenbHR3/h/Hb65GmleMP5aOA
         wCdJWtbVX9WCUei5gaEHx6mmXRjQRFi2VeYz1riTHYFsov323RHqZNzypYrO1Qy1X0IY
         NjWT5np1FOVtcx/7SfuMgbuh3/ynuMaBfpxwFuIvc1hfoiVMIzgmZGPS/WfEDwv8Ry/F
         PL5YRgt5Jt6YLx7bmEt4O6sEc38YEctwKZmoQH++p+b09sszH/mOHZQTGq0LP+oVWWEa
         /lsQ==
X-Forwarded-Encrypted: i=1; AL+hErE/pYocN6y3C5t9Hf0LFFWMkm+ZFLptebweKrGL3SZYaQfR4NmKxNh44cca0e7mpf52sTs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+vCurtI8YeVeMDW+rqEONLkjS0iNVDU4mi6PBtB0nksEnDxeY+
	2JTEbbFxiv/8aUqkIAAussDPmeuWuZCV8VUigUJ8utpjx7XqQ7CgEu4hC15f5JMbJadg1k5XJN6
	VFdn02shBwlKXvX23thkg7FIJ2o+qcEA=
X-Gm-Gg: AZFdTZf6h0RvBbhra4qLIwzqYvJjQBZUkwHQJ3BTIeRnYbMMS1mAO7nppc6oo7SGSXA
	wZ97onqA7ewGiFKfFjCPNhhNxsRk62lcyhrYVjj2w6weIjFZjBL8dXz77407eSUguccUtH78Nd7
	ELPyiEVt4BH/WWDgdtE9bRb9ejRl8LuZI7VxiZaXFvKCn8h83Ppr9Rajxug7qUwKFLvWtMdKUr2
	MNCe1zvFVLALr+4nFoWdTPhMwGktK5BssPIRQHV8H4YzltiKPgG1hujhNx+4YpO+z4z4YD81FiW
	21YDqRgKZQEM4FkyJTehYFzOt7lEdVxbIRl3EApyxWyF2X9/dFZK3QSCNzBhRyj3sUxNHr0Sg0j
	crD8kPP719LbC6SD+PscgO42qQpkPBBRkTVKDRojamAsmGkqiteWpLZh81Zdg4LtgI643m6tzu3
	IsSZutatulEZkpBtD9YoWG9WL0rvuOyQ==
X-Received: by 2002:a05:693c:87d1:20b0:386:a816:ca16 with SMTP id
 5a478bee46e88-386a816ce29mr5178321eec.15.1795461016480; Mon, 23 Nov 2026
 11:10:16 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-3-clamor95@gmail.com>
 <awSLzG6IxXjKLBCx@ashevche-desk.local>
In-Reply-To: <awSLzG6IxXjKLBCx@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:10:05 +0200
X-Gm-Features: Aa3M54qd0Q0FdKFQ-JpohuyS51xXnBrzclr62AhndFD0zExmhfAz7QgWmQX6nVQ
Message-ID: <CAPVz0n3Mm+GdsS_P7Yc98FVKOijXFzWocVCkzUhg+LPJ8dY+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: max8907: Add ADC client support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:5=
4 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:23PM +0200, Svyatoslav Ryhel wrote:
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
>
> ...
>
> > +static const struct regmap_irq max8907_adc_irqs[] =3D {
> > +     { .reg_offset =3D 0, .mask =3D BIT(0), },
> > +     { .reg_offset =3D 0, .mask =3D BIT(1), },
>
> When {} on the same line, the inner trailing comma is not needed (if we e=
ver
> need to extend this we would need to change a line anyway, so there is no
> benefit of having a trailing comma).
>
> If it's just this, no need to resend. Just a hint for the future.
>

Thank you, I must have overlooked.

> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136915;
	b=hyagMwVYSCIk61UdVpPecDN5yl8gWvMhNSYxLMJevkdcyB3jftKs8PCQreTi0H/Xw2I7
	 QVXHO+8a+CHJHe6/in2BupEGuNJphUyvT3WbI1kFgvdbnSeI7IAhCr4+VDssmD0OCFZmh
	 sI5xGN5+od/KZ/8AAB3Iu/J66hlwNDk/su4V3rJ16fDZJ6P7HQlWQxSjAbZ9ts0W3u0D/
	 I/f1yL5OZ4XgOotiTxuikohN0gx0aP9RrFn/8wSeq3Oj5yMN/7QFu9iDbV+x0ynvOoCmB
	 Rm/XCP8K36IPbBWvfZyjWriR5tva3G8eRJ1DsYeiOGvwgahGtsGTzgLVh+IUedZ4dQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136915;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wllQShmR/JuCZFw5HFfsjOJ/1ZX6yyXsqzheMstswmQ=;
	b=sTF4+27+BvED06YC9eLiT7lwBvO90ibB/Wizgtgtc9zMi10tedMe6E68WQlY/kBgt1gw
	 Qji5bYhUCjUDAEgrPjkwwVMHsBOQaCfClLRIPgOcQvjlnXgtVmKhURCuxHHm2MLlFgMIg
	 Q1kao08FdtTWVI0PAl/3sPyQ8nu7q424BeyJE/akaAcqSb6Q2c81mmunfXDj6JWlK/U04
	 bAAb5KmkAWftltl37ymqjVOsMGoKNrd53M61GHKGQLpGzAuFP4LNqa4rxS6qzJffJA7EK
	 rXjImMIcZQ/8BSWQa4MuC+W8SSf3JjFSSyfHidHrEO/535XURVNBDGAJa6lQO55Yh6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=GP54efQe;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4622B606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 21:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4622B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=GP54efQe
Received: from mail.andi.de1.cc ([178.238.236.174])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLop6-00000000ud4-2ymu;
	Tue, 27 Oct 2026 22:35:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=wllQShmR/JuCZFw5HFfsjOJ/1ZX6yyXsqzheMstswmQ=; t=1793136912; x=1794346512; 
	b=GP54efQeihiZvAhjjSl+Tt0hDB23kGc7ufzLYPPOd+/hShrP0Zxv8FtveQbIvGvUQWuwJ6gaDLd
	YznO3pl9w8E2obx2DdUDxh011j7glRrIFvZAZzGDbE5a1yyJ3HzCsvZqEyknUgjfry3awthQK4KOs
	aBfthiqi9rzL8qbnekS1D2YoLRPpQKw+B2/uHRoy4NtRXp9FoxZBQJN3woP5P9rtB1uL8/60s5WWp
	de9BuNo6giFTzaD3iUXTjHNm0o9pgR3knKeL/rCwlmsWFnqYPRQUVWxIVPSkYyJP+7bd+I+nl/aN6
	scqzadQwqoidYhctsfhE9h4vqax0t7lCrFvw==;
Date: Tue, 27 Oct 2026 22:32:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027223252.044bb5b5@kemnade.info>
In-Reply-To: <20261027101852.39b9031a@kemnade.info>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
	<20261027002635.6b831c0b@kemnade.info>
	<CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
	<20261027101852.39b9031a@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 10:18:52 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Tue, 27 Oct 2026 07:32:14 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
> 
> > Hi Guenter, Andreas,
> > 
> > On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:  
> > > This is going the wrong way. The correct solution would be to convert
> > > the hwmon driver to an auxiliary driver.    
> > 
> > Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
> > auxiliary driver of the regulator, which binds the I2C device directly.
> >   
> But that is a cleanup action, which is at least a separate patch (maybe
> replacing and exending your patch 6). So the other patches can go into
> their separate trees.
> 
looked again, I was wrong here,  vin-supply should be enabled before
i2c transfers, so we need the aux device approach.

Regards,
Andreas

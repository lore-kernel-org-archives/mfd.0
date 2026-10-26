Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057215;
	b=5EzRYcyILMVljTYTDe1uBXvJy0bfVoU9nENwvBIv77GsBX2h2A+Yur7RsG/fyi2npOC2
	 Kc1i+pUkbRD91lrr5+pV6MJsAQ7TvtsZEM5VGqKKkIOCj7VcKnv/3zHa/5C/cR5C+ouJK
	 d/7hl8i95GYvhjn4MK/VVtxnZqv8dmdf+JN0DCCVEiXqbr0msUwvRnX0p9hfXE/2gaIZM
	 c0VFg9ZZ4h85HHX5N1hlh8uyMDm4uWTcQOCa2oqQukqqVeZPSL42E/G0JNw0SUnKLAZPV
	 mrobkc1O2Qdl5S+hF6Rmtw01+4x6hKyETKl1yQCqdltaepMlh2jsUZktG2+JzEhxKhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057215;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TuMxpuKm0GqZ9iLgROZ0NfIBSu1Y+sVk0Mx1hT6klxU=;
	b=SypXdbCcfJF69qrxCLCnPhX+yXXYRXqjIsMVqWoAu9kZkDr+fgcyenbinU94jhhLRGPR
	 OtmIa7Z1rJofTjJPXci+2EpNYl5aMVixvtU6N5qjsT+yN+7tNlusgHPXIPrYwtG2rpdwc
	 OnjL2AfxoViP11VuqlhK1QIr7Yp1loiDO/SEnl4Ztlf8l55QPkIYnqkZ77Ag4SjwWBOmE
	 jVr1ToFZgMLOGVq6/dI8X1t7tlC8eTTgepNBc/t0xI0VvP9Ju0hiFrLaT1s23z7gHnfrL
	 pnzorErTSiw7amohDKPvLtgjX2xxTLeysLDha9KK58+jY+wui99FP52A+/uR8beVSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="y/f7HyOL";
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10A606A327
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 23:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA10A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=y/f7HyOL
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLU5c-00000000nRq-0BYN;
	Tue, 27 Oct 2026 00:26:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=TuMxpuKm0GqZ9iLgROZ0NfIBSu1Y+sVk0Mx1hT6klxU=; t=1793057212; x=1794266812; 
	b=y/f7HyOLsJbq3+w7fGskXBqBoB1B6yu61N0X8TjX943vue31BNYpoLhBXyTR4Bjzo5ky+/Hut2N
	dg1yaT08WVmZUvsJZ75EBrLyLOWxK2IvVjg8LzSlWnZBmSV9RjqIrlvfI05oNRbUWKTOCZTiJwmPU
	08ZO4aiIaRGntwholEwxwRYK+UI31+fI8+QICPyUDBDW6Q09xGm3q0lFYLiNSZIgEhdVvcM0OZ6V6
	gZUyz4oUpex9bxbr3W8jaXelJfZPiYCGj7KW4Fqjm8i5SMLiTvdKNBdRJIY/6+pVgaSbqiCylBis1
	BX18UPlVrMvQm49bNqZoBO5wEUv/3vT0oowA==;
Date: Tue, 27 Oct 2026 00:26:35 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027002635.6b831c0b@kemnade.info>
In-Reply-To: <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
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

On Mon, 26 Oct 2026 07:35:24 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> > The separate hwmon cell enables VCOM at probe. Report the temperature
> > from here, as the TPS65185 and FP9931 drivers do, and under the chip
> > name as they do: read it while the rails are on and return -ENODATA
> > otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> > hwmon driver.  
> 
> This is going the wrong way. The correct solution would be to convert
> the hwmon driver to an auxiliary driver. I am not going to approve
> this patch. I am not giving an official NACK (yet).
> 

First we need the problem defined, then the solution, and then we can
talk about what is the correct solution. The commit message does not
name a problem.

So what we have:
one bit to turn on a bunch of things,
after one time to sample (< 1ms), fresh values are provided on the ADC
register periodically.
after some more time (max. 50ms), several voltage outputs are ready.
Powering on those things is expensive, so you would not use this as an
ordinary temperature sensor.

The problems I see in the sensor driver this patch might want to solve:
- problems if the regulator driver is registered earlier.
- not having powered on the regulator all the time (that is described
  in the cover letter)

The way the patch handles it does not require any structural change,
availabitily of the regmap is given. So it would be a separate cleanup
patch. 

But it introduces another race condition.
The temperature might be read too early.
1ms delay should suffice.

The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before 
reading the temperature. If that register does not reset to zero
but just keeps the temperature last read, then we have no problem.

If not, there needs to be some synchronisation between the regulator
part and the sensor part, probably a mutex saved in a common structure.
And in that case, structural change of the drivers is needed which
I see the following possibilities:

a) non-simple mfd driver
b) aux device as a child of the regulator driver.
c) regulator driver containing everything.

No strong personal opinion here.

Regards,
Andreas


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793086344;
	b=tILl5QMm7A3fn30EZ0hGpOavGfdUoPQzBnzP+lPPbpusfEibnc5GYYhyNHEBbux/HGCG
	 +8HYLhSOSE3DeKe4+k2aOtYyyWT1kogqUN+4/T4LvGNGP/K4FR1c0I98hgm9uGoZa25ha
	 QttN2hx6lsm2wddR1yoG/GmtMyuYF4pxZu8mQMvFNkj2KTFcGUmp64npcUrpG9gBH5U7r
	 NByAqRGC/kmo67WOqh9UdBHALRAQ39cASXY8pPm5VFC8/XQtazOeMPZYlINeHG884Fns3
	 BnpfCMOtSNut3cemQAGhZUkzpTaQE/6A0LzxrV31jkFsdElvA4CVGadkBRk/5g88Tcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
	b=VJLnoz2xVhxHby1glF8vvMIWGwn8+q3IZJmQfnGVZWJEUI3vdpjse2TVDZUwQZze9zJD
	 6FmBy80ExOoiqe6wFx1/wdtrwt0DtTbD69bMIZ5iICw2GJt0Vc296HR1INK17tuLGZvjj
	 Z8vs6jJDLf/V3BvpLOaemWJ9ckGSR5R7dIyz9XxhZDi+z77eFD8brVUNOgUtzRImuZCLh
	 5NLZ7oFvCPA0RuUT2ETd6gG83vuw/DMW3RrwJ2umkW7maUA7cS0q0mpFRg6EakgCOboeC
	 0S2Ai2D7CTQnuDOxCcsXztfYfc2JTgQnQm7LctS+J1viYgilwGnjEsHxFAYdYM3qb/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FUfbw+pq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7E606A31E
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 07:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FUfbw+pq
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9eb579c0eso21682975ad.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 00:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793086343; cv=none;
        d=google.com; s=arc-20260327;
        b=RXPgW/mfFzstDp9G/nR+lbEzxrDDj/8PbR9UbZwptsZ5MekS4gacpBgMXivsvGwFVC
         Dbc9ivfukNNQ7YppXku+f4Ed0957XBZEba4nkHtslNCpMclC04Rqf8OzqQOBHqOmPXfh
         sRy6E4GOBcmGFdJa4YJ2hGE7U6+7bd7cIOQZH7Vxl6t0yNwtz0n0XnytKVt9GGLfCEZb
         1/8YeeThVsuLu/phJqXNBWTgD/4oxtNIkjkGItIiN5FGJ6qKdfD+Vmm7NAjBb1t4nEQ1
         YiIVF7/kojJgVOIl5faUWhIMR8lm5BnZ5o/kYQZ09G0QB4BYJz/FqLDM4/RU9PYYjO3d
         VbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        fh=0hTryfRc9+obTyMkeSwLERCOHxjDT7HLqmvyTkVDXnc=;
        b=kE31Hg5HSb3GLQ1Qd46z3c/ntYpfEsgGBopaAODgq4IUJktEK9fhpW46mGm3GaBwLz
         YaKvHDBCz798MGVMs5hC+XEBRbUZ508Manq7eETVXPJ0dtGd5JIYnIgTHrh7l6s+rtds
         69xOfSgjYFSwl7LU5HOv9LUuRntBJSvQBTWKbmeETm9ZvVFmgOhVgwO5qWcZgSjwQlcR
         /VPMMXt4v3PjcKbcCPjWIkjZkzyj9Sgaa3I4kO3yNpinx5NRUt1VXpAICujq0Z9T3T+7
         0h3hoBHpHc+hXNLzXL/51+Kl9uAgo1gqDaW1FKsyz5xUQMz6RKf7Qu0Q2oDJwHhUD0Jz
         CPKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086343; x=1793691143; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=FUfbw+pqdEHyt3qroK5GevXaruoEKXNjqJi/DK04BMkjsW8e846emnERqZsQ5nokak
         pex0X8QhG5a0mw5dXlh1M56WJ+bNNV0s+v0Ce/4VtvuDXHPbRdsZCimpqSxkOvkEoaH6
         zZ+BlJAmLPiyf+ASa0Z61+fNXB2mIkeneUl3EfNiUPBcxrQs31H8YhgPh61aaFsJNfFT
         3JojqzkbrdIk1xc3drOKP+0uV/aL1sbgX8mnfDxLlSrKtwAIxqZIcgzxlf3JbT1ZdW1o
         N9Mdqyjz+oowuS367DBulHrymjDc75am7Q0Qhpx6zgwv8icY4N8JrywfsrUeKeN7K3ON
         m7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086343; x=1793691143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=qsRcm/oqLL+vkVRO1xyNiB1ss1srFJAE4mZ7HdC6e2Ya9Q5mSoNz84HksHd2Jeo1pD
         bKEwoyuSQ9vkEf6lpj+axPWBxkmzPnbca2f/tTrGFJPTlhwHtDEl5IkQsDIuAhvnakKr
         4Rd33sbzqd8kh/Tbv9xk1RRdWyp7DJQDLvIs+f2q+nZMiLDLVwN4SwXN8Ha24iIEKAt9
         s+gwFE3/yyrD+x76AoQvS0xSxEC5x/Dds9DkZ6i7T02aBLruR4ATjRwU8h/XpdTDm1Y4
         sBZ53OYjOYO1OrcUXCqVcz/1w7PfPFKKli6pe1fWrxWIizYtG3KC7bb2mdct4aFH1BXc
         J1WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHmxtVpf77DTUoAnnIuR+4C6iqomXGAtTKkO8pus64CFqe5FRSeP+PmgE/mQdhkvKvUvU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRcB0ZiRQ76hufpbiI82VtbBLIH3FrlVF+3B11zBr7+6xP99Ib
	4Cw2GdeojPUcTbg0culJMY865mxER54kHiECF0l7gpVivG1rJXLqbswe30q4DR6Ux1mIzOveHEA
	g59rmfk4znizKYjUsGt76hVIoFWG/6VE=
X-Gm-Gg: AYBFou1OJKeUnmeGqPnyzMRikMRWMWVT0qZ/tV6LhESwYpzmwaNWcPVM1BQDykfg0XZ
	hYSk6b8Ej3pyceYS6oQ8/Ujj6ZS/hPFtX7zB8Qs1GG1Fw7Mm+9CXcbL6DJ49iKIwWX8a0j1Kvv6
	4m2mT2FPtgq2WyrsiBVOGLZX9K5F/NxlxbTd4Nqf5qUedTVXlT651H8GRVDrGkF0BmHM/Zc2EfK
	IHkOn1RU+pHrkYXWZ3sjd0Dqe5gb9++QfFzzZdU4mr4MOpSbmlWf8HsW/6+pLNoc6XH/CgY/w2B
	E5ZV1sWx5JnWPeGk+imGLGfFa+xV5wEOgrJ88ltlYM7NugtAD8OPyeIVlKtkSG++poyASp5s661
	MqSXxoCg0tHmXV1tNT73GP64VK2hre6FBBRrLG8EcODqBJGASJTRP
X-Received: by 2002:a17:902:cf12:b0:2e9:66c4:1713 with SMTP id
 d9443c01a7336-2ea9c917ba4mr66194015ad.58.1793086343005; Tue, 27 Oct 2026
 00:32:23 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net> <20261027002635.6b831c0b@kemnade.info>
In-Reply-To: <20261027002635.6b831c0b@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 27 Oct 2026 07:32:14 +0000
X-Gm-Features: AclHuK8Ysr_hMD-q4J-bxGC_qjlgkxL35TncLn6mKe9lS8sJrvJ37KNEcPQTV5s
Message-ID: <CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: Andreas Kemnade <andreas@kemnade.info>, Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter, Andreas,

On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:
> This is going the wrong way. The correct solution would be to convert
> the hwmon driver to an auxiliary driver.

Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
auxiliary driver of the regulator, which binds the I2C device directly.

On Tue, 27 Oct 2026 00:26:35 +0100, Andreas Kemnade wrote:
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.

Good points. For v2 I read power good (0x07) and the temperature (0x08)
in one I2C transfer, and return -ENODATA unless power good is set, so no
locking is needed.

Thanks,
Pablo

On Mon, Oct 26, 2026 at 11:26=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Mon, 26 Oct 2026 07:35:24 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>
> > On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> > > The separate hwmon cell enables VCOM at probe. Report the temperature
> > > from here, as the TPS65185 and FP9931 drivers do, and under the chip
> > > name as they do: read it while the rails are on and return -ENODATA
> > > otherwise. Boards that need the rails on mark VCOM always-on. Drop th=
e
> > > hwmon driver.
> >
> > This is going the wrong way. The correct solution would be to convert
> > the hwmon driver to an auxiliary driver. I am not going to approve
> > this patch. I am not giving an official NACK (yet).
> >
>
> First we need the problem defined, then the solution, and then we can
> talk about what is the correct solution. The commit message does not
> name a problem.
>
> So what we have:
> one bit to turn on a bunch of things,
> after one time to sample (< 1ms), fresh values are provided on the ADC
> register periodically.
> after some more time (max. 50ms), several voltage outputs are ready.
> Powering on those things is expensive, so you would not use this as an
> ordinary temperature sensor.
>
> The problems I see in the sensor driver this patch might want to solve:
> - problems if the regulator driver is registered earlier.
> - not having powered on the regulator all the time (that is described
>   in the cover letter)
>
> The way the patch handles it does not require any structural change,
> availabitily of the regmap is given. So it would be a separate cleanup
> patch.
>
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.
>
> If not, there needs to be some synchronisation between the regulator
> part and the sensor part, probably a mutex saved in a common structure.
> And in that case, structural change of the drivers is needed which
> I see the following possibilities:
>
> a) non-simple mfd driver
> b) aux device as a child of the regulator driver.
> c) regulator driver containing everything.
>
> No strong personal opinion here.
>
> Regards,
> Andreas
>

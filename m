Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902032;
	b=DveWltB/J8mKUACmIIj5KXsvsvt/mCQ4bx/G9zhhzJ5fXfDDvLjZ3xSAW7MXeQ50umna
	 mlO+Iff+2imoHT2vtZi+qyHqceRbnNgWDpUM+lacVgdiagq5f7qKItVJa3Om5l4ZdnW0J
	 w+SBRg7/JeHplQjawBmeqr5Qop7AIH4iXQhZ4H8Zgh49GayCCOSkogLQnzNtVuUEg4e13
	 TBVr73umXyzIaOEQDrdGTNfsihkKsmg4K1nxILXaCIEL/m9uQKfA6E3B9VugZMflsDN+a
	 MQIYuHva/crcWeU/ZUrJmwjFN+TvzKjYoob2QM8r2eds1pvCmtb+0vdyWIzRDKc3IPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
	b=hXyqKsT/o6I6JixcsEXTvdreMXKSvPdITrTu0dvpycSrj+M6P/1y/g2O7PQRX4a1IQlZ
	 leyV6z8+SBpoKyRmSXjfP/SgysWUb9bO0ZpDMeM9IFsOkLwG9E0/hfffggjQg1k86scPw
	 NBDgVPWujQqu5RHLlh2pcvw/wmUfnD2FtLAozrqQx9UKOt0QjBa/1oBfrmooMIYdqBLen
	 1J8AWCrgWv2BNWyPorn7Y8v/pfP1LmUq2OkOBa3fJEVIQISygn+vH9v4JOBChFj/9f9Ox
	 mBd8ArJ9aPJSTG4+nWRrZCAPtQi5XHhwRUk+rYpeAhQIgdMBoNhHJboDb59VwtXEzFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfPK6931;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A33606A329
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 18:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A33606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfPK6931
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so3241250eec.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793902031; x=1794506831; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=UfPK6931Uca0b0imvTX5zF+Y2q6FMjpFtHFOHKke+yGDJNfD1O/53elP+bf6EaHYlN
         cfaqlWCdkyTJmaHnM4JB1uEuvkvLuxdiV2f3UCX2vMzC+yj834ZhQoi8zFwY8BWqGJVD
         4tqbAgNyqEzYCgvLD8DDhj8CNeddSu4T8wECRdyZsGP5ZDP260nx7/G2pKzJuDzInPOD
         R3Bf9xb30ZP4M1ErvL3dTcKZCiwrmp9ITAF7WbYoB5R+FxntK3tEkLoTspbFpZ4xtR+c
         68a/fX7LEj8u9a5lZCFuudRoxBsyyhbPWjsr17K76ytD/J1DtxYw63VNEG5x1sVf99UJ
         0WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902031; x=1794506831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=rQgGwbEdPe0FS6YRmF0X/SA378wliidfIfeGTv+GyczQTsBVBY2LYOEdqjXB1uHjrR
         dw2K2jAmTuDzzvmWetzQ3NRYIUSM3jETHFECwVc+rL3PsOh+ALvFRYm8GxOUBo085kQ+
         clpoNF2yMzqTkGUeCCCHhGAUdvXW0I5FHwORJXIa/pALgug5gVlDaxM6Rh2md4Ou31GJ
         DP7xPxFOCTfuaKl45EaVy0kduzytNdRjUyLUTW5uraZIQc89CCXBwHPDsDzk0kemkTnl
         8R+fNf/EWOZPxm6ZxAg7YBWzvzAN3qJ0JmhOaJnrQ+QBr41Lsqp7PdTqanvHNhKtxbgb
         klGw==
X-Forwarded-Encrypted: i=1; AKwUvBylpBuSQ8Zqf03wa9A3C756G9mI30qWOhnSNZve/EU5YAFm1x4L6MNmy/N3oVJKEYHZ/zQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+LEJBDhT9s5GetiwBERHpv1jhG2d+U7YGadStk7zlETPr3rL1g
	7VRTdZFhGyhmrYNml65YSHr8/4t0nsGK4yHlAgTE2dW++9/1js3cDAYf
X-Gm-Gg: AYBFou0r+LiFgTTaT7rPaRjC1hychnQFV16IWtIuG0Q1lggmdqn4n1LMsR6rO5MEpu4
	aBvGay4XQj8abWsGOmi6v6mC7h32JQrqydbi0F5pFsllSwEsvKVqwccSs1QBiasNfnPWcjNC1L3
	3jTb8TS8ghyP/cJ6ImsGeFzA9A6p5cJn73vLhC6Dtt7FuBHt/x3EvP0iqhnKPnSNDY1F8tDmfpf
	1upXNwu9nZKm4ghtW65uSPkDqSz6ENUX/7SyFTY0LcZdFZ4JaDyeH/aAcFGMf/wSk5kOYuOjXy/
	5Cd7ZgunvOm+EcLLnJW4upLZPoLIYwqHHGttl8Xp6Nui5GqIsp8zdY48GN7n6qyVfWwZQeHyx/A
	6SrbLRhCkUCZ5ocCnsl+8naLlMn7iXK/2h77sK9sUrSJZitb6LN09GJNMZBdHcQfY5h6Sthsn8j
	3s1FQYQbZmF0ILTJU4AssEBKi6u35OCGC81JeDxqoHrDFzdEjuTb4LbDdHtNowpIbxTD9xPJwM6
	w74xigc1Ym/LmLhYK44g+n1TLsSQXAgkX+cxowiYvXwGPCdCBgfuCVej+AA7GgY9cNY+8IpfoB0
	P+U4C8QLt9nxTkAs5owTa4VCkpF+tWjQxhh/UpDMDjjW6JG22P07wLO/HPYFBoTXBdnANg==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr14869976eec.25.1793902030913;
        Thu, 05 Nov 2026 10:07:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm12512067eec.10.2026.11.05.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:07:09 -0800 (PST)
Date: Thu, 5 Nov 2026 10:07:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auzFQkIPZScADEeb@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
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
In-Reply-To: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>

On Thu, Nov 05, 2026 at 05:19:30PM +0000, Mark Brown wrote:
> On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> > > As far as I understand the situation, wm831x was used on the
> > > reference board (Samsung smdk6410, removed in 2019) in addition
> > > to crag6410 but never anywhere else upstream. The question
> > > then is whether we'll ever see a DT conversion of crag6410.
> > > This would require finding someone willing to actually do
> > > the work, and coming up with a way to handle the autodetection
> > > in mach-crag6410-module.c so the correct spi/i2c codec
> > > child devices are probed.
> 
> > So I guess the question then: do we need to keep this board at all? Or
> > it is time for it to go the way of the dodo? And then we could drop some
> > more drivers as well.
> 
> I don't really have a great replacement for it.
> 
> > My goal for the series was to move along legacy gpio API conversions, as
> > well as move away from the GPIO lookup tables (ideally I want them gone
> > now that we have software nodes supporting describing GPIOs).
> 
> It is a bit hard to get enthused about software nodes :/

Hopefully you do not need to pay too much attention to them as they are
hidden in the legacy board code.

The benefit is that using them makes the driver exercise the same code
paths as it would on DT system (unless you insist that the driver is
very special and should only use of_* API) and allows dropping support
for bespoke platform data (in most cases).

Thanks.

-- 
Dmitry

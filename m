Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0042901E
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 11:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786446210; cv=none; b=XrGQdx7JjlpQr6UypVTt1tXT3A1qszlDdN0xgPMLS4DJoYoCCYHSMV5eaN9vt0RjhWOeeSiPH2kojv3MUD2deGG1HC8HipFgiaHV8R7N6JXXwjhxsUOqzYspewbeEEWLyDW7XISLGA3RM97+zmTsYhOtxdrljNjote3+1g0XzHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786446210; c=relaxed/simple;
	bh=goCAgiGsYzYmjtz1zRhN8F/xv/xhGM2puiUk9GjOUoY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N7QnNEBneoqHV2U9F4ixnmRRLsZWcZMbTtcODXEqE9xUjYas+2x9OL0kRx/eQRi+sXFN7afVKJs86K0qUrkczQfUkbuMbTjsObjGtfiOuKAFzX6V/0buVLZe3tU6JLskv5AO/7hsgAzREzL4zoJLvE9P40U4nTZ0cSwpkVVC6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Zx1qmApe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lWqT2DPm; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Zx1qmApe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lWqT2DPm"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C690A7A00D4;
	Tue, 11 Aug 2026 07:03:26 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 07:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786446205;
	 x=1786532605; bh=Em7Pmk+5eUG1SWBMVzHDtE7f/cjRyDtElutYuL2DugM=; b=
	Zx1qmApe96uqoLq7+Nuyvsiv1DCd3/Q0kA8bceGLXxmyJhy5AzHT1Q0dfhXr7+/8
	5zmGCkhEDdUS69G3dqoele8tePC3i7LorSmEjp1Vle+9Gw09YuB32fao0uHg7P/M
	bKCaJQ7qt9TDvqHBnNZ2NgxptO4OXe9sF6r9yn5BVgugRhKyOIcarGMrzPmc7I96
	g9JMc3XKccuz662aGLufwSkjR6Uz1wDsNcWTI5Qqk5X1gyjEzTQOcSp7P92xPumP
	n0idtP9FRV+lwoHmB2bVK0wG/cLwCO4mxkfQLLS0wWaMRxzLWglHtctBW5eljGYw
	yBwwIMj1SUw/oEUK9gtMSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786446205; x=
	1786532605; bh=Em7Pmk+5eUG1SWBMVzHDtE7f/cjRyDtElutYuL2DugM=; b=l
	WqT2DPmcqbFvMdAW+3LUdSe5qt714VJiMYEc0WuMsvYzWRL4RIMLye4HL2tlhRQ4
	cZLCWAUMz4bpL/CBMyZ6VIp7lxHYjFf50NKFVCDY/Aqhnrjf8iXzw0f/M/itKUtP
	a2OdqKKYS1s0QlvmBjQWrfdCRksmxbkycWAsbffhXfPwDK+VHfNAOXs7JppU1Lhz
	RRcDC+p6cbfm+v5CJg1kcjHZPvKDHLRiV5YvZCNYHZnDecbF6iiY4TIp6dzDhssQ
	lidnwTWPFyNbJ5G/yE56OKkjRIXSm4IB9BPwuKXWDEI05sxJtkTw8CrPhqCjtYGx
	R4Nb/8wnCUwnI7U2sl0wQ==
X-ME-Sender: <xms:eQF7anz_Yd9aPLO7tISzP7FDrQooLkT4ZxPSPgLve_BmUUNISp_O7A>
    <xme:eQF7aqEDIhJ-fPNjJEskRDIoyM7kJLgZ66qiL2Uv69jo8dphEqfMQnQOPjXlUeHPR
    lnbb3dTHimVpQI7MM9ri62s8IPttzHkbAcKN4vPAG_MQB3fSaSyy-Nt>
X-ME-Proxy-Cause: dmFkZTEm+YK0hucMyyiNj16IVivtiuxyve3yfa6oej4703fz3vU5Ms86zBYr2daYx/Ap3f
    qoJj9unxXzj4SmURlVdQMQMSHXFus08gnoqMhKsjWH2kcLVUJu/0NeboIXsI/RzyPuDyRJ
    kNEVXTgQwTcxxHMrbxViqzs/5QTdSqNge4U/KGZNUnnSRQ5zO41RINg2NUyAIu8zBbRDfc
    iT4WgFpWW2GwotcMmM58gEREVItxyf/fNcHzswJ87QvjXCkMB2r5uh7opzOF/Us+/X/ao5
    BlD1cpxJBpOK/MXCW7JlN9Pbeuq3SFeQzvDBrl4BV2go62q4Q4KdsjgYmpLozWGpqRWWZH
    32wZ4dTuLryuW/EvReq1SfYZct1shwLLGtgBaCu2L+eF2xkfhgbTgRkBCJIY7dYKmWatSB
    pBI5BEA4J1UFNagDR0Vr3qElrmCgLoJVr6PKlX0DSEHYN8p3np8ikKSr/RK0Ltb3SqlCxe
    DIYd53JUZWuttRbTZ1D5u9sLqEuyVmEgAAICC42KtcO5XNMx1yHDx+eLTxyO7ev4PQCY0w
    US0lizxIu/pF53taNQOjrJQ2kyQi1V2CxHPl4bflphQ1Ue56GiIdG9LflyV/NMPFbhVbqz
    rTvb1r4442yS3cP7dKyqUFBRIu6mpawIxF9iVKNFsJL0n2vgb82C/mV3JLww
X-ME-Proxy: <xmx:ewF7apTPIfsizE1OBLI0Er28EuB8w1FVJ97d9Lxy7lRvw-13_bFzIQ>
    <xmx:ewF7avVAIHo_BphPe6NEliLvyyZvkzKIyB_alkiCoTblIpLh2Tgfuw>
    <xmx:ewF7ajT_mcX84rTUVyeVaLYPdbTiQs5lgu0OXzLF1W0GS9b2UQMOYg>
    <xmx:ewF7an1iPwr6z5yg6mk7m9lpxs0LDsXMAOAYJSNuUQkeDt0MRoCDMQ>
    <xmx:fQF7auJP8UIyUhlTJkmuzCvZ1W5SbHPVrIXVBqGPMGw0lE_HSjxirXYJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 34D0332A006D; Tue, 11 Aug 2026 07:03:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A9r4Xi2IO-i7
Date: Tue, 11 Aug 2026 13:03:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Hilliard" <james.hilliard1@gmail.com>,
 "Andrew Lunn" <andrew@lunn.ch>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <7bfb45da-8b67-4fda-844c-e2608c36d539@app.fastmail.com>
In-Reply-To: 
 <CADvTj4qUEA-ccFj0cSQgHb8+0jB4m6tcpsZZwveZhC_RE8w9vA@mail.gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
 <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com>
 <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
 <CADvTj4qUEA-ccFj0cSQgHb8+0jB4m6tcpsZZwveZhC_RE8w9vA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: syscon: Add managed registration for external regmaps
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026, at 11:17, James Hilliard wrote:
> On Tue, Aug 11, 2026 at 2:47=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:

>> I don't think this is the right way to do it. As far as I can tell,
>> the device you have here is a generic mfd that uses a regmap, which
>> is not the same thing we usually call a syscon.
>>
>> The of_syscon_register_regmap() code path was added specifically
>> for chips that have a traditional syscon but depending on the
>> firmware may have to access this by some other means. This is
>> already stretching the definition of syscon. I don't think we
>> should take this further and allow normal device drivers like
>> yours to register through the syscon framework.
>
> This was suggested to me by Andrew:
> https://lore.kernel.org/all/c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.=
ch/

Maybe Andrew can clarify, but his reply can also be interpreted
as saying that you should copy syscon_regmap_lookup_by_phandle()
into your own driver, rather than changing the actual
syscon code.

One problem I see with your current approach is that the lifetime of
the regmap is not the lifetime of the user by the framework.
Unloading the mfd driver while the phy driver is in use will
destroy the regmap. This is a direct result of syscon being
a very special case that must work during early boot instead
of being a general-purpose abstraction for managing regmaps.

>> Since you already have a top-level mfd device here, just use
>> that to pass the regmap to the child devices like we do for
>> other mfd drivers. You can e.g. do this when populating the child
>> devices through platform_data, or get the pointer from the
>> parent drvdata.
>
> The EPHY is not an MFD-created platform child. Phylib enumerates it as=
 a
> struct phy_device on the SoC MDIO bus, so its device parent is the
> struct mii_bus rather than the AC200 I2C device. It therefore cannot
> directly obtain the AC200 regmap through parent drvdata or MFD child
> platform data.

I see, so the fundamental problem here is that you have a single
device that is connected to two buses and both the OF devicetree
and the Linux driver model are rather bad at handling this.

I would probably do this in one of two ways:

 a) have a driver module that registers both a phy driver and
    a platform_driver and figures out the interaction between
    them internally.

 b) have the MFD driver export a private interface that lets
    the phy_driver interact with the i2c registers and
    make sure the i2c_driver sets suppress_bind_attrs=3Dtrue
    to prevent it from being unbound while the phy_driver
    is loaded. The symbol dependency itself is enough to
    prevent the mfd driver from being unloaded here.

In either case, you still have the choice between a proper
abstraction that can deal with multiple instances of the
ac200 device, or slightly cheaty but common assumption that
only one of them can ever be present.

      Arnd

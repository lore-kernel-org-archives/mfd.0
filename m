Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED33A05F2
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380115; cv=none; b=mk0TpKOR09CAuJNYoC3hUfNUNW2JNgWSk+BXuiyyq2B1Cvmpe0PnKeB5NTiXs0nS0xOnqnVrPxS/pqe6YWAmWUlWhzVFexiCG89/KeewtyKspfKdKjs+uNHoRgZdfhxCOJId4HcsNqqq2HeMkOmSCbpJ2RLapHrTdp+p2nqghh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380115; c=relaxed/simple;
	bh=Vzs3QL8r2lXu5DvPJZmOV440mb7vuG1IIaSAqdRJnp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2y9JHomjsTIIb6bnGD7+UNNq6WT/QA/m1dnWQH2y5FUkCKzeqoN/1WLedGynvRvM63evGhpcj0eexnbYIELFj2PndpFwLur8swUuHDiqWnfxTdfdhBzKHL0B83jtJxoX6ybwAtNecCQW4qDJ9T1Kq6IpcU+G7+OTuyPWJ7nWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3WypMi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3WypMi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594C71F000E9;
	Mon,  6 Jul 2026 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783380113;
	bh=4mXfWEImzzz5cv+ra+SNfvpJVckBdcPhUEjl2k9KCWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3WypMi4DLzNRatXp+hY+BUh56VNirHBwH4c+5rs1sAKFBnOtx358zjLA+Uja2NDI
	 m9ZDzUZirnDhpZLpEX6G8er0VsglRTGxxpktS5U6o2r48lCYhX7+6EnQ9LfCPBzz71
	 1pmt0accifL2V0M6w8XHEabZyia57IIkWvU8t9Z8IfOw39iSS5P65DgSWD5n1wYLb+
	 oG+eAfhGaANfqmQ23ES13MuiB5jazRMLgXL7Vo6IjHtXb1lTr+/RFWtxDVPqfzk+yA
	 iHFP12UBYs4N4aorM2euT+QIhbYFvvJuhRj3TjXImRS9BK4b4daKzGsOE/UDN2g6ou
	 Te4ms+7Isg00w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: ucb1x00: convert Assabet gpio-keys to use
 software nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-2-6102eabd31d0@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v1-2-6102eabd31d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 23:21:52 +0000
Message-Id: <20260706232153.594C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use-after-free of statically allocated software_node structures up=
on module unload.
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem formatting guidelines.
- [Low] Link failure when compiling as a module due to the unexported symbo=
l `ucb1x00_gpiochip_node`.
--

--- Patch [2]: [PATCH 2/2] mfd: ucb1x00: convert Assabet gpio-keys to use s=
oftware nodes ---
commit 0ce5070eaf8a221281523868978ac01b677f4d83
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

mfd: ucb1x00: convert Assabet gpio-keys to use software nodes

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Assabet evaluation board to use software nodes and device properties. This
allows describing the buttons and their GPIO bindings via software nodes so
that platform data support can eventually be removed from the gpio-keys
driver.

> mfd: ucb1x00: convert Assabet gpio-keys to use software nodes

[Severity: Low]
This isn't a bug, but should the description after the subsystem prefix be
capitalized to follow the MFD subsystem formatting guidelines?

> diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
> --- a/drivers/mfd/ucb1x00-assabet.c
> +++ b/drivers/mfd/ucb1x00-assabet.c
[ ... ]
> +#define UCB1X00_BTN_PROPS(_idx)						\
> +static const struct property_entry ucb1x00_btn##_idx##_props[] =3D {	\
> +	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
> +	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\
> +			    _idx, GPIO_ACTIVE_HIGH),			\

[Severity: Low]
Will this cause a link failure when compiling as a module?

Because CONFIG_MCP_UCB1200 is a tristate, if ucb1x00-core.c and
ucb1x00-assabet.c are compiled as separate modules, ucb1x00_gpiochip_node
(which is defined in ucb1x00-core.c) lacks an EXPORT_SYMBOL() declaration,
which might lead to a modpost undefined symbol error here.

[ ... ]
> +static const struct software_node * const ucb1x00_assabet_swnodes[] =3D {
> +	&ucb1x00_gpio_keys_node,
> +	&ucb1x00_btn0_node,
> +	&ucb1x00_btn1_node,
> +	&ucb1x00_btn2_node,
> +	&ucb1x00_btn3_node,
> +	&ucb1x00_btn4_node,
> +	&ucb1x00_btn5_node,
> +	NULL
> +};

[Severity: High]
Could this lead to a use-after-free of these statically allocated software
nodes during module unload?

If a user process keeps the pdev platform device alive (e.g., via an open
sysfs file descriptor), pdev's kobject reference count remains non-zero. Th=
is
prevents the internal swnode from being freed, keeping it in the global
swnode_kset list.

Once the module is fully unloaded, its .rodata is freed, leaving the
swnode->node as a dangling pointer. A subsequent call to
software_node_find_by_name() by any driver would then iterate the global li=
st
and dereference the dangling pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ucb1x00-as=
sabet-swnode-v1-0-6102eabd31d0@gmail.com?part=3D2

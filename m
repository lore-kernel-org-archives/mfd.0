Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78253BC680;
	Mon, 27 Jul 2026 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179002; cv=none; b=GXqL3RUsokkGWrdjFib+CnJ6097Y+Z9RE+4aUGABO3EwnO/sxWoWM+GEsDxJCEOnLiFd5bvXKKcL3Niu5Vp7wS3t2TCpG5d2AAOH/pLgKqeCpLPuwJtucU20u/Q7tGSTnuQkoIp2Sc4wiuv1C8dJAJiQ2N0I25rG5eesk2n/vAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179002; c=relaxed/simple;
	bh=DovaZT+9yPFowFNYAxYHzTIcYcIs8amIbmAtasBbeiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DDH6A5Ikw6ZV1HiEMjj+ZGVJDXyRKdV2N3Fv6XIlygTvWgu35Dq4Jfqjj4J8BaEOZaIn1ZkSdXtN6Tonlv00PkJKwHI4rjOW0Atxz5eyiY6XiGvi7TeeVrOSImRy8CHDpClX7hjrr4DV+zHcJhATBdAf4lh0TsEzoEsJeU20/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVHj8Qlh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVHj8Qlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F396B1F000E9;
	Mon, 27 Jul 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785179001;
	bh=DovaZT+9yPFowFNYAxYHzTIcYcIs8amIbmAtasBbeiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FVHj8QlhKjxE5Eogp7wfgdt4xxticJfNRkhuzm4jnuPPVPkleZ79+7IEzRjBun5hU
	 KSb1WhN/gtCM3R513S7kzMUE7gHlQVJgzE6fXM/2Lf9BpbuvIV7/T/GsSbvZq7iMyt
	 LuRnTaq73r/w2zuI/s1xq+CQEvsjKSJUiMLQz3MZTN8zE2IHWYyh6ZDftqxtC8Douu
	 MwoSaQ4XUDbwqq76U9TIcAfp5IfGFasvCbdCoMcxrV0Sb0IhYCxIbFV8JFRIfIz993
	 1Bgsx3tl9hhXoOTmHfPIAbmcIPA3R5M1A908WII8yvd7N2G+l5ySV3rJ8YE+cFyAnr
	 TkbhqFBiuwv6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, neil.armstrong@linaro.org, lee@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:03:20 +0000
Message-Id: <20260727190320.F396B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D6


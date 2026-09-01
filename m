Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D97424D41;
	Tue,  1 Sep 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276836; cv=none; b=LyfAXyITsAyXJ40RVrW54dy3LM1pdF50foIXPvMsf11CFBGltVWbOWeLXCdg6OgO6IFkY4Thvnlx+CV+VyP3Zh8JDejg/xYOAS3JZOpgc8LzuYp6m+l8VS+dH9V47UnT8pmbDyy5Sp9Dnh7J/BmqglIvIN2NHRcWEzGLJdCNlbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276836; c=relaxed/simple;
	bh=PXbOCXvBggLKfsHnwXv7DIo4RXz5rkcl3q1Mr1Jqzic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QNAMebGRQ53KskkCLnTiFkek8GH+LFfsDaTTqgHezOswG5GUm4VXBI07m392tsGibfVwH/PS2GW9m4LeZRr/qw8musvSPxmNbQ57k8BRJS8CtZzlQN+8CXfTpZI51AOFsGsqmwm+Q4AuB8Yz/XyRE46o8lsS1XYwC658FoBxAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izxxYCdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izxxYCdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B01F000E9;
	Tue,  1 Sep 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276835;
	bh=JXKGohViUF6CBZb6/o/ALtWvXJOIGt3FsEZFS1VSQ+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izxxYCdQQ+gRei94a6oDoDurf6AH3Fs4wNT0uFAJ8v4P3oi+ik3HUDmFUVS8III24
	 zSff/m/B2LLN4VmzdGnL/jwdYinmXtcNbY/7XK9SbZjZMARr2C2uJrHGR74aVZ95rf
	 hp0n4Y8O3jnCSW4xcZ7x+N+N+7K9H1CPmnw7JUDVFTp9/Zlx1md9ZpMmwjOuU1SRlV
	 kx6ajE+XIA52dOfMTgtixbveO9E3GbCBKBTWfrrYzKl8KXs+bvbbuiHxZ73eNOIzjo
	 d0+wsgk/0NjrrGqTnlSAuy1MrYfP4d5vkLckKy9a7BzNim5zImO/8H//rbvRipJ+5V
	 wLbbrLKLHqhnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-3-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-3-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:33:54 +0000
Message-Id: <20260901153354.BD8B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Refactor probe() to use per-variant values
> instead of hardcoded globals.
>=20
> Add dedicated regmap configuration for the VIM4 MCU,
> with its own volatile/writeable registers.
>=20
> Introduce struct khadas_mcu_fan_pdata to pass the fan
> control register and duty-cycle levels per variant.
> VIM4 uses a different register and level set (0-100)
>  declared as a list (0, 30, 40, 55, 75, 100) compared
>  to previous boards (0-3).
>=20
> Add a new compatible string "khadas,vim4-mcu".
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D3


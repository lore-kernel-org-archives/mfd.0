Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5329D390CAA;
	Thu, 17 Sep 2026 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632386; cv=none; b=dsfdCNWSDJ6ZV7z977t1j2LR9Wap8eBnyPOukKDtrVufbdfNHjdxPRzigvKuC11TQ3EgztvnXAbbCdl57IIhribk+G1dBz5kqOgb3IiLB+vQbgX/54CLeAfJJSx+RiAhh7HIYSffrM3OUAJqLzdak6B0apdo61kccDL22+bt5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632386; c=relaxed/simple;
	bh=8Gz1O6bHK+/l82isF+y+AHNB5tc3EmVfPqm7/H+Yw3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EyBVlpW7jCuepqt/SUBvlL2TnqCpSw0AVad4wbV3h0JjbpucZ/hpY85HGDrINFh/OojVTuJQGNUr+42O8ayWL3mFqIGB/3qcVB8mE620dE8tff1M6f1qjyNqTr2xHIID4ivGNYy2kwYhCJZRkUuVYtWu/CtVQdKdEAHV+zRfO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF4neACB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF4neACB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4941F000FF;
	Thu, 17 Sep 2026 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632385;
	bh=8Gz1O6bHK+/l82isF+y+AHNB5tc3EmVfPqm7/H+Yw3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IF4neACBWwrNk+ePNZLETHyxTyuUnMkvG+G6qraDKU8w+91rG8M+ZXkfD4LVAFq/+
	 yWt2MG6oW0HHGHkhSiF9ZlmfqlT3iukHkYyzFeJz2w/a6JEgl2pn/rrAwU0KNAR5tA
	 V0yB2nnm7R/RtS0A0uT6WayAYA4/iUNR4LGH0TR9vj+uBhl//n+jMutVWMR/HO+vBB
	 TjQydHBxxkpFhnm22B0yWFGN2QwW3NkxnZ5EtoM4+q+/oepTkU3AMZ2woeApaLU3hb
	 EQh+pF7UsnjPczZIhBa8cjzNW6HBSO8l0MBeYZx4vYTxuqU9HQ0ZzGfHKalIp8wpNU
	 jp4kKrBwtbwPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-1-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-1-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:06:24 +0000
Message-Id: <20260917080624.9A4941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Some values change per variant, add the structure to manage it.
>=20
> Add VIM4 specific registers done for a subsequent patch, which will use a
> new compatible especially to get the right regmap config.
>=20
> Add an enum khadas_mcu_type used as value to match.
>=20
> Also fix a kernel-doc warning for the khadas_mcu struct.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D1


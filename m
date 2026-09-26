Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B543B6CE;
	Sat, 26 Sep 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427006; cv=none; b=AoViSIFWRNxTu0ZTu/SuWKQurQ5mu9VqY2k+tIeMcSgCl2bUwVE33Dy7jwwgwVJIF6ZlclKeUzEN/UrBV5btyYUSM7JYdkDCuayvkNMVWRcEqj8pyg99YcSmIS3BMz4A1gydNRpDjC8dqOVqYDzkjoOtkI4jydRmSYOT6vSAQqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427006; c=relaxed/simple;
	bh=bO/qd9FXS2tdf7PVuSrhiXuwx+0bJ3hXtTHFaV6G/fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MdVHdILlA+h6hxZcm+GL/I5xobmqPXoWuH8Qxd+/zw88ATLwrj2SrPZDvANAxTMAhnLcodYV9RzZJyPkKVNc514KJxHMEmIYKpNFAy5gvAI/sllkgqwlI6iF9hKN86zCkgzqUmDPnKPvNfpz3zE7gw5oBbyjYQ9IbE9IxW2X3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxTQ4rhk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxTQ4rhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BD11F000FF;
	Sat, 26 Sep 2026 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426997;
	bh=gJafGliddkthwthVl0CmhvwyDIvimytYrZtK9gR723E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxTQ4rhkAo/BzBF9FV+4FUtePpX1pM7QyyS/dlTjAWJcyCa2Ev0E3mGLQz1xW8dzy
	 3sKfzLoszKAU3xzXa3h+nh5rF57OPQS1Y56pQbK3NkU90sULzWJc5gAaZKpgawAQOW
	 Ag6r/qj99F+NNhY4nd5S6aIAbFry2HSOt3rXjk8oH9E8dLTWLNf81weaeIOa4XlRtb
	 OpOYXVJjJsvfi5nORthi6JAHMGoXjQvwi/FY2IT29sj1t+Cssnk+fpsRt+i2I/9Iiw
	 dQLw/Op0F3SN9/DdULP84OmxeLmVA3XAydFUC8gBlqJpogs6VIR6Y8ZZnignuv+fEY
	 YIWVmApjtPo6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 11/12] arm64: dts: qcom: sdm845-oneplus-common:
 Enable USB Type-C port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260926-typec-v1-11-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-11-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:49:56 +0000
Message-Id: <20260926124956.D0BD11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Enable the PMI8998 Type-C port controller with a USB-C connector
> description for the OnePlus 6 (enchilada) and OnePlus 6T (fajita),
> which share the same USB-C hardware via this common dtsi.
>=20
> The connector is configured as:
>   - Sink-only power role with a 5V/3A sink PDO
>   - Dual-role data with USB role switching
>=20
> The VBUS output of the charger is not supported yet, so the port can't
> act as a power source. Describe it as sink-only until VBUS support lands,
> USB host mode is still reachable through a PD data role swap.
>=20
> Only the HS endpoint (port@0) is wired to the DWC3 controller since
> these devices use USB 2.0 only =E2=80=94 the QMP USB3+DP combo PHY is not
> connected in the OnePlus 6/6T hardware design. Consequently, no
> DisplayPort Alt Mode is advertised and no SS orientation switching is
> needed.
>=20
> Switch the DWC3 controller from peripheral-only to OTG mode with
> usb-role-switch to allow the TCPM framework to control USB host/device
> role based on CC pin detection.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D11


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D8D3AFD05;
	Tue,  1 Sep 2026 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295082; cv=none; b=fkgbCl7G2GLX6cEVhJL7m9xhCTpSufU7kLmAu3Ojd5erjcPX39D/CbS/a4wDQMgeHis9nR12HLA+c2IZr2GXXC/DcpTmfOfj6JGrjGzir1Hv28p5oVIfz6VDK01V5y9DnQl2HysVhMDwkwGowsUv8Ikv9lqeodtG0SSI619kTF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295082; c=relaxed/simple;
	bh=6nFe16wuZCt7elQLMwznQ7ji0QBsu7tP+ZGIK6wrh54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BI0z1hweKgun+stRf/A4o9DeqNhN71Z3Y3NhX91fqhmVn8P8nZuxy6L5e3VjUsrez26XnXpBJtw6D1sdr0e6LtMDNROo+ostnsH3wIMHSyEQqB5vHxWds4AJdZfkmo5d96vzw3RuDe9gI5JmgR316A34Cs7mEZ9/GCH0pdWlNKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnYEbR67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnYEbR67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52481F000E9;
	Tue,  1 Sep 2026 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295081;
	bh=6nFe16wuZCt7elQLMwznQ7ji0QBsu7tP+ZGIK6wrh54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnYEbR67KE1quDsLkTo33Cd6+Q0xTFfanwtPqDe8aiRT7Q4gV6NluOJ49N2VT9yfT
	 AcYf0BwoD7CYbtGOmsQ9mFZ0TDpTx5xPMNPcXuIgx3gMz6DGyCZDJk+ecZv/yrtu9C
	 gLkyBhXdoG3qg/LtZ845wP7C8iRv/xXuOfFI7O9gzPOG2erEFYXvtZfgGFZfAZ95+e
	 1pLqXJpFX/QD6aXmECpuksLez/6HbgnYEYN270BpTUxu7/Lg126kqPIv7xbqrhT71r
	 SL+9eomFXu+8/uDDZRiZN81gQ+PGJQGr2xpsDtE3zMJkpOTp99MaSbyFIda0gHxEHo
	 6JqyH9bal2zmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] regulator: ab8500: Preserve OTP-enabled buck
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-10-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-10-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:38:00 +0000
Message-Id: <20260901203800.B52481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The SMPS enable fields are initialized from OTP and may leave a rail
> enabled for discrete consumers which cannot be described in the device
> tree. Such a rail currently looks unused to the regulator core and is
> disabled when constraints are completed.
>=20
> Read the enable field while registering each switchable buck
> regulator. If it is nonzero, mark the regulator boot-on and always-on
> dynamically so the unused-regulator sweep leaves it alone. Keep the
> enable operation idempotent so applying the always-on constraint
> preserves an OTP-selected hardware-control or low-power mode instead of
> forcing high-power mode. Synchronize the cached mode with the preserved
> field so an OTP-selected low-power state is also reported correctly.
>=20
> Regulators which are disabled by OTP retain normal switchable
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D10


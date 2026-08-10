Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A963A2549;
	Mon, 10 Aug 2026 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346109; cv=none; b=qnhHpWA3Huw3Mj7D4hT2Io9rGMA4sObIMSjK1q/PKcM447gIVTdOAUiiNYK2yqHnrAuuxhiS+2/bY1tIEVbELDUAfNg056lJLThg8ygScBnYHsZdfxQLZzTUD8zMzCCDmNysgfdYODbVqzEjF+GCcZbHBVrJYer5PhnO0i+NCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346109; c=relaxed/simple;
	bh=QbYftZKohLDayC5vZpFy2SUkABxfV2wz4hxMSwTCPy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jc8wGMJqNFHfgihaT/3aw//Bh/t+MJ2ylhnmrjNXdHn2UiopPSbWifeICOJDw6V58fsS4SRNoNs0rk/Z75wkEijU/zU0KZv4m7PDl2d1J/d1/Oe/UPmAJ/A4saG9hfXOiT1vGgNE8JHz+tuV+U+WYmDsJzxf1lm9cyzI2u6ozD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqwkZAq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqwkZAq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CD11F000E9;
	Mon, 10 Aug 2026 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346108;
	bh=QbYftZKohLDayC5vZpFy2SUkABxfV2wz4hxMSwTCPy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UqwkZAq7/crOaY0Hh4iXPWK7HpReQh583AhT1BpYtB8H1iP4aM2EehuqYCdjB68/L
	 XF4xVuK4lOPGrBO8fwofMWJfGWzm32MOoTwHYGxmpjD/qo5JNsJDf3ZZIFQJDBBX/s
	 wCvfSAqSgg9+CBabdZYazmBciapYBpwydWVxLq9M3B3jAM4ayRMSeRBYAG98/dyb7E
	 k503SLOCKhVla9UrRf1+MSWZ4OMuuBL48qQA9Bc1QsDiYijjvtU6fLjtMxJnZTQ/RM
	 q+YTosvF1kfOYDv8XEahNcRDgXx8oJ+pOHKbq0VGFR5CbUSFJVdDO9jXcR9eVJypVr
	 bo2T57XnUB7ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, neil.armstrong@linaro.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260810-zx29clk-v10-11-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-11-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:15:06 +0000
Message-Id: <20260810071507.A4CD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D11


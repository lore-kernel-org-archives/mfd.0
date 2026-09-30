Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C738F259;
	Wed, 30 Sep 2026 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736273; cv=none; b=YmI4bXAXE+D0HktJz7DAOI+65r+uqGvtcUmR7K0/w5EelFfrBYvhAqmUDLo5ksL7scnSL6GT/PC2Am/+cv5P7KOXx41cEJK5Vvj91fxTC+JNd+L0+9BAqbnnG1npVfvznd2QM+0RocHK3ANxK7DIQykrcC9zzV2aQxz8A9Ry/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736273; c=relaxed/simple;
	bh=IiUxpBlEUq8sn5i3xLOQPrmE8izBOvt7ECfvx8ufbek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u2oDN9mYKpo+RDcRG9OA//uRGT2Be1GKb/mOFVAG11aVim11csL68NWVyRggNQg2O8TpJRPGOkH/Uoi7PEEgXyMM6VT0dUUt2Ascwf34ysqv6M+BJr016QESCcIccKYDcruDDu6dl9TeAxfC6CNi+GfXmOxsUtDpqyoqARa8v/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBdBdxQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBdBdxQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E451F000FF;
	Wed, 30 Sep 2026 02:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790736272;
	bh=IiUxpBlEUq8sn5i3xLOQPrmE8izBOvt7ECfvx8ufbek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UBdBdxQ2w0/SwJSeRpJxnSnGMyau1CH2fCb34XXN9DtoP0LQzypRoJs1MuOcJGWBh
	 ZXdY/GFw+OAKxgYSZCrBGdUtB9umbzV1lw6mlgrkcnUZc2J1KR+t1Bv8BAmBMqZElu
	 QsTcbs3/sLT7ThVrcYgCjqxl34qtefFMKFLO3I+dZHagF9VW0596x8BNmR/35mWGe2
	 MfeJL2x/kP96OT3TONs3eZnf/OGG8d0heQ9GykNPjqLIQwJOwYh+3hk7SG6yw8uuMV
	 Zb9kcYF9rUOwc8XvmDrW8/6ygJNuxRZ/rnr5+mE4PLUzg08J4lsw5p+iN1PT7TgGQ2
	 NWgOOZuI2uxjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: convert lp3943 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaosheng Qu" <quchaosheng000406@163.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260930023923.49917-1-quchaosheng000406@163.com>
References: <20260930023923.49917-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 02:44:31 +0000
Message-Id: <20260930024432.01E451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert the LP3943 MFD binding from free-form text to DT schema.
>=20
> The LP3943 is an I2C LED driver with two sub-devices, lp3943-gpio and
> lp3943-pwm. The GPIO sub-device is covered by trivial-gpio.yaml, so only
> the PWM sub-device gets a schema of its own.
>=20
> The PWM schema documents ti,pwm0 and ti,pwm1, which select the output pins
> of the two internal PWM channels and are read by pwm-lp3943.c with
> of_property_read_u32_array().
>=20
> Assisted-by: LLM
> Signed-off-by: Chaosheng Qu <quchaosheng000406@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930023923.4991=
7-1-quchaosheng000406@163.com?part=3D1


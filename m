Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585289;
	b=cZVobBWN8Y14j+xwQEcDaWy19Qhba8RvKMYbFKPuBZj/ScCL9GnCLCC7bgMQ0JbuBig/
	 5FWLeC723kvMQ50ZF1oLtNLhS2oZfo/XlK4UPUhYN9PYKum9948cH9yob4t3dn9n28mpF
	 P22ZoZuD7DChaHqQVsH8Ks8B5EnohIqNMNwtAuOyLgVJCjlGTyqG8hEImDC97AWfJdBD4
	 PBl478+8a2JBQMo8s9o5/hx/LpvLjsDj14qyRGZnfHgO4APK1Fshr6GfUwPSDUcgnW6gJ
	 3WsJagSLNHrz7Kt9foUyQrwbhqkRAsM7uKA4habNydqucuDrHN80hwCMWVB6wAXviCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J7Z8rdZNAkOrSp88Iq5ovK9tgcD7oDjpBvFD8qHctCI=;
	b=jk+FBwSiKSI9mnyGWwIGOnKY65Xr2Bg7oKIHGg4jI7xy7xcydpiG6hQuJJ+7swioK0zZ
	 D39CC6Smk2k3gNWchd35QS7zkv/U4i1xuPB8eZvizDFvjApaK11nhQt0nAHCYCSj0g0HL
	 bMuRt8AwfN3Fh0IP0eel0ppRZwnOPUj7DOgRYU55zkEaMq8xPE5IPLMtweeG6LKYgzu1/
	 MTQ7EfA6MVwfE0R4r4szoQe9eajpu3zLoXkgZUTOn9/pvighJhAJHkN214qs0sEy5QiPx
	 wRbPSs0PdNH7P+w7kPwoLmbMb956MQH8RI4F3OzoqK2CiC1MW4fWBbvU8qcs5iG+m7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+QX6aua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB61606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+QX6aua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A011F000C5;
	Wed, 21 Oct 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585288;
	bh=J7Z8rdZNAkOrSp88Iq5ovK9tgcD7oDjpBvFD8qHctCI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=I+QX6auaNm2FhY35SPylaYfwGQy5ISwottOM5pfdSA4QvCtQG0ywmaj9GNZRUnNO9
	 VDfErWztyuwCBLXlo0ednRZsWVBW42r4m1fs3smupAJoeTHqukjTd3Bq7kCOCsw06x
	 0+O5FlfH42IKl870c0mYy80+WDFXgCdXY/lssRPSfOLIULXxQAd51AGV3zv3i/k5/k
	 G6HQ+5zoTDgJMWfk5DTpX2VlOs3HjLlazyrAZtSFFVgYK8AzMFlYd1R93sbT3MGaVa
	 ibpbLRGqEQ+XigJFqDUGjWlsFgz9ZGUN39ix1NRph3Xcd2CEVvRH8T2THR+nX/JE7W
	 WgtwH6JR8ap+g==
Message-ID: <sashiko-outbox-180230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/28] mfd: max8907: Manage power-off handler via
 devm_register_sys_off_handler()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-12-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-12-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:21:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When the MAX8907 device is configured as the system power controller,
> max8907_i2c_probe() assigns the devres-managed device context to
> max8907_pm_off and registers max8907_power_off() as the global
> pm_power_off handler.  However, max8907_i2c_remove() does not clear
> these pointers upon device unbind, leaving pm_power_off and
> max8907_pm_off dangling after devres frees the driver state.
>=20
> Convert max8907_power_off() to a sys_off_handler callback registered via
> devm_register_sys_off_handler() so the handler is automatically
> unregistered on device unbind and the global max8907_pm_off pointer can
> be dropped.
>=20
> Fixes: 9582fdcb6fcf ("mfd: max8907: Add power off control")
> Closes: https://sashiko.dev/#/bug/linux-d73d6689-d160-447f-9b3c-710fd4c4b=
6fb
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D12


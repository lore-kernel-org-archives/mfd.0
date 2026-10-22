Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792642063;
	b=OhmO0IT3UtZNwX6X0tsABjkrGLG0RoIKcTuIAa4UEfbO3/CtLqed0y5u1uCP19efQXAo
	 Pyas5M7iGxw/LMlgQdI7rFwICPab3lOh0LzQhwh3qvtUrKi1NbjovNW4Wt1Qf22HZ/TxO
	 IWpex2wkkN1DZn4Y5Sikmr246WJAWqHhaOKJabRaxun+zlM9GQndTANUdJtMo8Dqxvwdi
	 kXgcZe0ReI+oCEwwXUDC5lSMR1a2AZKXnAHmFnAitpsWelm/YLSWTiP7y9Hy0x9+oqTTt
	 T5JIekfHhnYcCBarWmJaqNY2IDaSrcE/LtOBZnDhhi9wE0ndqmzKDmrkp5LeuTEpeYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6GbHvNL2aKXYWJmnOVSIbAWFf/0hNoAwPHN7K3Imn8I=;
	b=lN8hd8fbcZ+8tW/txd+RG3ZspKTAno3s1magDd1b7QxqHDQYm+yeF2ujh3N/qW59Rdtk
	 nQ+zdjP3hrRD/hWxl50EGRbZxALtqSr2l/gW3KhS5gFP1OVFL/uMn/+FEgwQveMAx4XcK
	 jPo5Z2NRPPioVxUtnp8WsXuJOpOpOm/pc7gJNZXrA+Mp3euRX3ACJNoidmaFRCUZMvkmb
	 ZkZV5XiGL1rE0JU/J8bY7jlPtPvFxbvDaxhUqOSq3w2J8q7xUYqctogxs+UQ67ltaBxBw
	 1OTHUS9RxYaoGyLqEJvjEaNk3/zat9XQgbyyHM4UD8ct1xh4Q0/ndRtUUJpEiXTWJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4QsvdDB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E247606A31E
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 04:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4QsvdDB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA39A1F000C1;
	Thu, 22 Oct 2026 04:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792642063;
	bh=6GbHvNL2aKXYWJmnOVSIbAWFf/0hNoAwPHN7K3Imn8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M4QsvdDBaY51C1nmXrgHJKMhHhqi9WcY0oMfqt+afucAomc2HrdGQ+gJoM/9VSpVK
	 2sdB2u7jRPUNqbqMnrqy0WqNNvZRJRuH00HMQa3iwP30Wyzhk1/0V/+4uUVJ5uEvtS
	 7zgZTcFQV80y/IEzlgYhSwPNJJwHB98r7zO2cJ5Oae7348vvKmooB+c4QWGn+Hyd6h
	 cJLPJdYz9mlltM2unludHMX7AQ0wJCu9F9VdoQrwp/XQyNrkOwA1+ry1ppq6/N7t3y
	 rBfBqFQg/gJLCfGPZmOUcHK450fhCY69YRRFsyCFllMRqIqh70g3Av3iOZeEj9ouAY
	 5dLJKwYKquK8g==
Message-ID: <sashiko-outbox-180993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: intel-lpss: Set d3hot_delay to 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navon John Lukose" <navonjohnlukose@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261022040453.45797-1-navonjohnlukose@gmail.com>
References: <20261022040453.45797-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 04:07:42 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> LPSS controller still sleeps the default 10 ms d3hot_delay in
> pci_power_up().
>=20
> The PCI spec asks for those 10 ms on D3hot->D0. Mika pointed out that the
> LPSS controllers are not really PCI-connected devices, so the delay is
> likely not needed. quirk_remove_d3hot_delay() drops it on several older
> Intel chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
>=20
> Nothing misbehaves with the delay in place, so this only shortens resume.
> On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the touchpad's I2C controller
> autosuspends after 1 s idle, and the first report afterwards waits for the
> resume. With d3hot_delay set to 0 the i2c-hid interrupt handler for that
> report takes 1.1-1.9 ms instead of 12.6-14.4 ms, with no I2C errors. Only
> Arrow Lake-H was tested.
>=20
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022040453.4579=
7-1-navonjohnlukose@gmail.com?part=3D1


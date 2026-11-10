Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348072;
	b=rOUopc4+1lX0ZgxNED+ZFQt9W3sHL9WRZx0DFix86pj8QQVks5CWMJ2qt+XAnSnNXLU/
	 ozxfDJTTobFcJ2KgYR1udTD4RBC8fWlLvOxxb5avysBIWaIJwJsjsIRYYj5vzTUZ8f66k
	 mCMjdpgsdiQt7WSJ8MVcWZ2QyzVbOettHft0TEETc2wZ476/CWIumK+Oe+fV9zg9vtOWo
	 OU8GG4NrE87YVBynTlSFXFP1Mbi0yNEzPasrHHymYeh6kWp6Sv3iiwoDIS9wRe0TM6ZtU
	 ZxYELPmH+VGG46tIY4W7cGPWlF9zY8iBsO78YO0gSqmjCnZKFvJv5qYAzqP6AgpXknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QwQ1RXBf3PU52K12lCpy/744iRhGsqhHKmmQ/o3NvC8=;
	b=x7FULC4WJnfZBOhCDUdpKG0niyXDLt1wf9yjhed56Mw4ijLEjRwr0TuQPB75ONh0P08B
	 IrZ7bHcRhEYCcJnAQVHZI2uIhmbgsPT/eTrw5Cd/nGOKYgZ809KqDJrF0uuPBINdL8kRg
	 1mrRVTegBIn5FBU8YmSnuNcCYEDugRQ4jH4rP4EmeXmePrU6l3FyBWtuaCQTUBUxqp9mD
	 XpPF6ZL6CyOuuMpr9ZKNsfn+FF08ibYZz/8KOSzQFVeqxmHgkLRiVIUt+hgWxOciI5i3S
	 vAGUsTvP795r6LLGVfzvO5W3XgYD7/SXtiaWn+vykevG4tp7ibUDI7n9DWi3aEv+G8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3bgKwkj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A04606A31C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3bgKwkj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C4F1F0089F;
	Tue, 10 Nov 2026 22:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348071;
	bh=QwQ1RXBf3PU52K12lCpy/744iRhGsqhHKmmQ/o3NvC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3bgKwkjjrXSRMwN9MFtAmICA0+DIXFANxL39qsuC3g6fJbKxVOf67wBqMDT29Wdw
	 vObcrBpgOMkSFzoZTwFBTAYTwO5Ydgkgcp8iwkc1xGBJ8bXNoRhzqIFrU1P7qfNX8B
	 ZTCiyRWqdTmMIwXjDH35QX8W8shPqtZodw5lEU5mCDxUAbMkDUJrayZRKY2+RPJy43
	 xNBMZgRQkHVZ0Eo2kpDpkkV4ICsJCN9NMdHqPH7jC5Dk8V7qz8qsGgA2yuk+jway4N
	 6NTNztgutVI6vavqsDX2VnrB+2QDap/5mT0+kqN1a1C8xpmJayyQuMdRiPu/DkFcQT
	 eFODUCCdTQs0Q==
Message-ID: <sashiko-outbox-207806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 20/20] mfd: Unify style of pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <9b6547adee2fd84843eb9fa350be8b00faa2f385.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9b6547adee2fd84843eb9fa350be8b00faa2f385.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:01:10 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D20


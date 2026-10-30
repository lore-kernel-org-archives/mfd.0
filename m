Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379865;
	b=gPhXdNieLAIHrpWO7TRfnazS+CvBjzhCrL2Idf/EkIX9OuS9XjvIUw2mAEY2VXyeHB6O
	 yDrRxcnX8FC/+9tPIkDcTD59+I5IEIeeVR6MDyrFv5VnkywMISeAbeOLcz6Ry66NJ0BT3
	 DxbiKyq7c67jQt1Np1J3yh5YE9qwNGBOEOa4FChBKE8ar3f8TgHyWbDtxXFw5OGwly7SV
	 hmnEK/UOagt/9IfO9ff1X1B/qjaOYPtHIl9veIWCiXJTpHBxZomCfNVvLb6OXhT0k6E08
	 SLSN3U5hHphFs8pV92i9xAawMhBbZOqV5T/cfjIGpA6vj9B8HRA30EAdBMSiB5q/29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wECXbKO2Sv6M8CZ+S5rTf+FvgzKZ+AIVEMlYmyJsP0Q=;
	b=zt5ei6whX05ZDZrivgDgHsbhk/H3kLWJJtQ7gwGgPUVN7KoihR0isfYmXURcfSISEUiP
	 Qf4tsMIszxLldwRfMelhhCPAlWWTpZKkSg8wL5y6P7CLsnGzkejlXM20M3wpcmJX55Pnp
	 YIf7H+PSgls/Tfl6y+dMPIafRJlJNB04TjPuLjwoWby+H4LEJd6R1h4nb1cvJSiPHOE3l
	 d1biDITpIbLSVzOznMnMkvKfpX6DVuO51NY4YsChLNgVVSVHr8FmS0QNsuf4xj1WddKaO
	 aPD+nKWUNHs6vuKZtIy9CaNX39ISILU11su79jwjrLp4yZ1oKcD804Dstg8uzbP52SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSUcb0Ol;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C7606A31D
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSUcb0Ol
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23041F000C1;
	Fri, 30 Oct 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379865;
	bh=wECXbKO2Sv6M8CZ+S5rTf+FvgzKZ+AIVEMlYmyJsP0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSUcb0Ol6702IpdHQ64Kq4vbx3v+/QCdcGPfzIZzPW2GDOQ8qEZfkwaqGZM2Nwwez
	 ARitrWPyD9HiXVrPa6LU5e3b4l/0tUDJzaJmY0ojNwWPQCoe5Izxy+uR4hlPdeb+kj
	 hoEH2sBXYESaRqAL+qug+oIrPM4OELnuJQVEFvwi4Q0ET1UEa35G3we/1rJfTxlQG9
	 G1RA9rHEKpodmJosIjGxOQmGsnyWI8fWVUB02aFUg6CZqLtNRkVmnCfDrnnHoPv48l
	 szVsaHFwsCJuYpYOjwd6pcuGJRpyMIHzGsFhE7+cZ3Z3W4uIcd7Lmt73ciIDLKSXYl
	 hDpYcLYDmkqcA==
Message-ID: <sashiko-outbox-191302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] mfd: stmpe: Fix potential use-after-free during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <f25172a8ca446456fa3e856b1b8b76e11dace293.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <f25172a8ca446456fa3e856b1b8b76e11dace293.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:04:24 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> stmpe_remove() frees the IRQ domain before removing its children.
> Deactivating a child's interrupt can then access the freed domain.
> Remove the children before tearing down the domain and supplies.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 57bf2a312ab2 ("mfd: stmpe: Remove IRQ domain upon removal")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D4


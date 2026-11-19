Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082727;
	b=31fxE0BJFhWvp+pF1rS536ZRjHPmVJTDf4YHgJjFyehJGldpdWNw9O8HRn8Mup3iucIy
	 4Uhoi0ZfNiIx0s2NBrzjCPFsfEJ3a5SRrJDkHQT3Df2EoYQ/1H/46ReahfImVKlMqzlnT
	 Uo7LTX6zUG6ghpPTyx/qajzcdblRXUSpFGqRSZuqhCxBEchVwqGMNa4FsZEpwLN4GxBYE
	 LK+m+gYqK1E/4lP6kJ1ZjtJnAQNjHSRLfkwpZx/xXqy0WLSm1f6Sn3FwzrNuHctdxNPAx
	 7QkI2FDzSLZkIYGSfILYQZXoNO4JYbmlLM8ZrRfmb2rA4mhOBhzThTZosMthu6l7VbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082727;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mfKhE54NYpgX8jBVUBl95ttLSudEy2xHgDeem5xI6qg=;
	b=VI/3nuzmszRsvyQmmqxhtcYCmPUpXukk7DLooheIRNNZVDrzM4CodwfyTXt92i5bgRLm
	 Oj1ELBAIjMn4adauicCBTNI13EDsLwacZ9lQ6FQjhKwcBICcAn8/Tx/f8PQD+pfq5XutL
	 IURRFCReHoSLZuZcz+KLeEvKWQ1sSgfvueSWss4/eM39M79EV04Ynv9urLw+l72BMVy0S
	 UK3L3spmqZ+zX5HnhjnvnSnie96ONBawQhIKquib9mAW8POeXwK6AqdAEGAAFHWZlAw4d
	 04d/rKNhV+4sgniTOxLfu8METn72ADBMREGWe+wXW6i8TMlgdw7s46/IHqNDfo+q9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTE4UCJn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF4606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTE4UCJn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAF61F000C5;
	Thu, 19 Nov 2026 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082727;
	bh=mfKhE54NYpgX8jBVUBl95ttLSudEy2xHgDeem5xI6qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YTE4UCJnn8X6A2m7nLzUau8guNLENFC9BpzTQuzRKZxh9oy3TpUiHmnSxEHNPSIXk
	 Kj9VlqIOHlR1wQ+f5dkF475MGWVOSepl5qoQDaFavfPz+vlRJLYrAprMSq5a3Diga4
	 jE7UXoBYGaSVDKtPhFbPPRs7CMBpmZchjz6nff0KMVUOMxrE5p+r+u/xPM0vk4UkOW
	 Pc0FsJ5K/eif8p0wKvqJ9IYya/Gqw2UsUk9Er04tNjE21PcNmqQaPYg2A78i1c1kxI
	 OdS1e/UXbMdDNkskcQ57LtURdRb5xRQ3efSiEATosnQPukPdKPvPYaPCjKYHPa3m5s
	 u4Mdn8ieE/EQg==
Message-ID: <sashiko-outbox-222910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 5/5] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261119095449.555593-6-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:05:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.
>=20
> The hub SMBus slave agent can receive downstream payloads into target
> buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
> to support the receive path and forward the received payloads to the
> registered I2C slave client through i2c_slave_event().
>=20
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095449.5555=
93-1-lakshay.piplani@nxp.com?part=3D5


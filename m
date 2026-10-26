Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029592;
	b=4M9t6rY0ywH7FOpGpOPvBUbSG95DXz1FJSFiJ3q3vcCLkGWHNTOIPuDcWUp+EzCRNwy9
	 CCFj4GUgi1zTQOIHcJjqCxIljG+vtW6C0cXnXhv8hUYJAgvUxjvyCIUjB/z1U+IUM6TyD
	 bNQexempbD6+Hal/KIrhXCnWokvm7F9rHvE46PYHVSCLsYs9f5r9ligZnYk+F1mW9rNmQ
	 wNHAPqkTEZOZa8C/xIfxxcbFYSKIsou+JNMMiN7wSSV0SS7VvBRRciq+W4tVAxBESPgFy
	 lr+6qO8DauFVCeX3hHqE0v0nfENnPy4CfUpNwV4ej7aQJ2o7WHspNMj7vAVt2m+fsGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o49Ufkygc2fssl9FozE589O8OcvA3zkmCOrxj6OVY30=;
	b=bNfIixHCG630H5bwRZumdVYgAd4fwO3E17VpFfhtGcv6wZni+3UdyiOIFaYn/yQ8JUMD
	 i86Ohyf6n/bMw+QX5e1w8z55LOBeRXAZ/mYxbunY530UWUMeIFvn8byO3udDwk5l8ZEa3
	 zU2j23nS+Soohd9uUGl3PU3A2j95oQBRiR+h8uGzePcilQDj2AmkwU2OoE8knrXEKJdDL
	 5D1OxW31Kig+waKIPkxVX45ld9O9VslU/osBOzh3YUxP/WITBRhD4JYiM+a0mFzbyRwgA
	 0jOidq/+si8eqBX1gMUi0DjSK2WTIKMQ3vfx9RnyffHMVlpxDKSKo5JLMDSqkxueVlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJeE3DLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA725606A321
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJeE3DLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556541F01828;
	Mon, 26 Oct 2026 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793029591;
	bh=o49Ufkygc2fssl9FozE589O8OcvA3zkmCOrxj6OVY30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJeE3DLxjdXPnQHt/Bmrdy21FQkQNkAlc74vHtkwduFYI6HpyqNG3QHFehbAwHISs
	 Uo1PSRY/j/63ojQs4S5iMEQIPbzXm1doFUySW8RjFQz+lIZDW8Bqk/KmAgZzPfhbES
	 Omdf1nfglzchbE/vDHkfRhVm+87V6ZnzfcIgR1cVdiEyBR09AzTEP8HRlCpsu9sarv
	 TRs87YiCgMycjS9H4w5b4IgkxDm8dvgENYPsebX0wvs4sctNU1Z2pVBcMCHR6jcmVA
	 IWjOUsu+aOYk54vB91N0MhAE+SjyKdm8uIvjG1idOBsklqjFt5PF7hLMJtZNUCF+SS
	 W0LhOEoj4xNCg==
Message-ID: <sashiko-outbox-185456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] spi: sprd-adi: enforce the exact transfer length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weibin Liu" <liuwb@xiaopeng.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261026153253.689525-3-liuwb@xiaopeng.com>
References: <20261026153253.689525-1-liuwb@xiaopeng.com>
 <20261026153253.689525-3-liuwb@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 15:46:30 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> sprd_adi_transfer_one() never looks at the transfer length: the
> read path dereferences t->rx_buf as one u32 and stores the result
> back, and the write path reads two consecutive u32 values from
> t->tx_buf. A transfer whose length does not exactly match what the
> controller touches is a bug in the caller: a short transfer reads
> or writes past the end of the buffer, and a long transfer is
> silently truncated.
>=20
> The SPI core does not enforce the expected length, so reject reads
> whose length is not exactly sizeof(u32) and writes whose length is
> not exactly 2 * sizeof(u32) with -EINVAL before touching the
> buffers. If the controller is exposed through spidev, a userspace
> client can submit invalid transfers in a tight loop, so use
> dev_err_ratelimited() for the driver's rejection messages.
>=20
> [ ... ]
> hardware was available.
>=20
> Fixes: 7e2903cb91df ("spi: Add ADI driver for Spreadtrum platform")
> Cc: stable@vger.kernel.org # 4.15+
> Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026153253.6895=
25-1-liuwb@xiaopeng.com?part=3D2


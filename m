Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518194;
	b=zVLx7v0kWSaLim/HmvFhCXvLmbCOlHJxZld1unAgLA2iNRUDhzHKD00WZwknJ35HIQQP
	 S34r44rZ2dERFgY9U1tkpvLpdKbGjYl+W2vffJUqiMz8XAUDDfKwjDdMkD6i3Y2ZbSxdY
	 Woji1DHfeJp+hQPW17vg6peKssshmXzEjVn1F1joQCSF+tMVg51n4CWmp/xo98ZaSFKkA
	 hz/Fzfla+7uLNpYMh7skrZ48rB+IEjZYCrlbxG3wZWZbQk0SRmdGYuCdb3TdrU5K8cBnV
	 SiLXTYhUsbHiDn2weT+MsRwwjVi1s2Z4aV2tYB4peVFdrWX2ABQrVYQTT06IkUi70Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518194;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VbpmE09Mq2Dc8EtfA06LJflMuZRKOUfj7+eY9B/yqw4=;
	b=Xz3rMkxKAxd09QZ2RK139OAYz52lv+43ETsMW1Ve5zm60v1U1hnnmHuTiABUzRW2hXDR
	 JBU9wH7PRNToE9VaOdtIhAfGsgA8l6U3cffV6RDNg+UinI3d9zJIERwp00XUptg+tfXjJ
	 8mNOc391U9ftZI+Si3t/77wteC55XvF7p1TjGJ0Lb1dxQUoAVvEm0eqm3rtrYAn4fzcn3
	 oWib9Swka8GL50lxh9RiFN9bwH84c9tnkH0qfugpKK8HdfBDBXMTSUrZmcuJNm5TzDjDY
	 AA2Pnk6stLmU5v0A+smlRFV+qndy+1kAiz4U1kNsc69OQWXbVtA42aOJH88rh0SQVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbXpRPHB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3475606A319
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbXpRPHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211AD1F000C9;
	Tue, 20 Oct 2026 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792518193;
	bh=VbpmE09Mq2Dc8EtfA06LJflMuZRKOUfj7+eY9B/yqw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbXpRPHB1B5fj2GP9N66SMqHOxpA8u1vgKP0Vr2IW6Pm97TsEdjjGXZpzUwz3t30K
	 zNPFjRcbU8F1wu74/iaerwsrhPibwAwAq0O0dQXStMp0hluUzu4/dBAj9gIjPxSbqW
	 L20uf+PMaXJ8O9GQ5LnqO/fX9YcD51lJwnxjmpnbjykh5TIEcwcTrzwpMfgOd5v4dH
	 oG2vGmAl4E6B6SmxBQbpzy0MHwSrq/njyN70+yAkvHcM28Pv3a3HnuitEEpczTmPLr
	 meU0ZuYcILtZM+/MoWgMX+21lorNu9XJXR/yL5L0cbS0IHCFgi/WpD1eMBCJXx9CCd
	 XCCYfNK/2+2Qw==
Message-ID: <sashiko-outbox-179436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add
 MT6392 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-7-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-7-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:42:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Val Packett <val@packett.cool>
>=20
> Add support for the MT6392 PMIC to the keys driver.
>=20
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D6


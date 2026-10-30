Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379653;
	b=gB5CRn4CZsZHVH9Ur5OBcesR68WZvG3pTMvgV9Jb7ED4OBBDlS/ZeZTQXzkdx5YACX2z
	 lR92MOsMzyUw7LJL8pEJ/xfX1wARdroUdsXtC22q2aZu+S8TjukwN/Z6fmXC7Dyo5MNxD
	 YTKNfz5rDdg833KzviPGG57sdxjiQ9uP2Mh2TSi/LVvMLBqXFpptyJBd0vzRcVmKut6z1
	 A2hPSfVQMjp7wp9js+9MdXQL/bJi/CjqRS50ur24JVOTvsTj7UUqhq+sMFlzL86Wh0Hnx
	 kn3SmLyfUoo0VsBs6T7pHDINW1z2XzUQ2GvOhliSIDZOa970WQbO2KIkcePQfoYC54A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u2HuWys8bZfRj2GNcIAvGIfrTlJckM2sYDhiQa7bnxw=;
	b=Q3bjjFjyIVOIXVeF+fYLTjWrlykYGv1HbREmWC7z8sg66bJHnxlFhF7JrV6Gh1vWdDlp
	 x8T+0bIC+px7UuR+oduaX1hCmJqhRg7GZfu09vqmaR8t85wg058PLuq4UdZ6K3xb1/2v9
	 9tlVPBW17PIhdPt+11iZbaNJmAQ/Zb3wsLYBn+BGskowpsxXD2iJAWuic2RQxbwt3nz24
	 o/Do1tvSNS4EdhpE4iCrPkypEEu9qqWg8QbOwW1IMhgASFN/0SGTGjix7icCGHmTt5hIJ
	 N5qCSdgOXlCMZt68JgF7kQd81YysQ5+dUKEbh2dJZeNol8YrrSuw+AS41Mqjfjcn4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQjaAO1f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812F606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQjaAO1f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933F71F000C1;
	Fri, 30 Oct 2026 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379652;
	bh=u2HuWys8bZfRj2GNcIAvGIfrTlJckM2sYDhiQa7bnxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YQjaAO1fwVvIfE13uckEs9Eajd4vr0aAFNinb6U/MjdLimuXnJ6rRNLXug3G1aDGq
	 DHNJAahaqm495LgNEAOdbqP5PCStFkCVk5Q0j2EOzB4kfE0Bb2TZjF1sH4K++T6U/I
	 ZmvzOrZ9+dXWcDP9y4qX709Eun8lYXNu5mN/3JP8Sby9v0Ancdin9YGasIQMePKEe5
	 WB2khjai2zbEAoWEE8oC9N369Vc55Ep4gjWhrpqGXxpKvqJS9YJM/qlzi/yghFSnXR
	 /wVEy1XyhcMEadlHMp0Bh2kFm28d70DXDB0MNeP6oI/4x91TEmDZ0ECCDmY8FPANoy
	 QE96GnsZO0OKQ==
Message-ID: <sashiko-outbox-191298@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] mfd: wm8994: Fix potential use-after-free during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <6c39348d96fd188f514e9b0f1e5cfad19af6d0ae.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <6c39348d96fd188f514e9b0f1e5cfad19af6d0ae.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:00:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The IRQ chip is deleted before the codec child is removed. The codec's
> IRQ cleanup can then use the freed IRQ-chip data to look up interrupt
> numbers. Remove normal children before deleting the IRQ chip, and keep
> the LDO children until their regulator consumers have been released.
> Use late removal on probe failure as well to clean up the LDO children.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: bb63f7d33d35 ("mfd: wm8994-core: Disable regulators before removin=
g them")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D6


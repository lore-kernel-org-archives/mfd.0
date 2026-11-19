Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118251;
	b=w0u39uokGCGHg29Kpnw8X2vQsmQDulMuHOuaxmfascPK0mUmxT8U3RzpdZZ411kf4usG
	 Bvfdg5ys09v3aZwfE7kCCCi4jAbhiGRpC0HKOkPjw4zg9nvEXO4qL7On4UeZVUJIuMSS3
	 fR+Qn3kbUFUqqAme86HksKzkwrPuI0P8iDamvcyibYOHl8YcXWKlZgOFA96+A6VZl9t51
	 va8ROjhrvKzhkuy3+ns4p9djclkMDWAZ4GdiNh0YD4Ah+IR8r/NdRKLGdIaxK/Dvy4kgX
	 NZsnVHEgw8/vcWqNsbvQAvbqcZCfl830JCbdvsbV+KcBaPMOci4URlFVSguC6VnCp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118251;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VbD77C66nYCHFlbT6QlAxVkfxaAFAodZP7Phn6s+1sg=;
	b=r7xzhreJsGc2b650c75ua4xUywG1A9aAxvpFL+/1jHZr3MDh7qVG+hNy7p3eX1PVgxoS
	 dD8d+4o3U3SehRHDH6DaTtE0a0e3HQ6/D4SIb3vUpKKmRcHLMUlQXr7oIybuzDodRK7a3
	 QC6CHz7tiASNNqb/k2hYuh1A/etf+Hv1SuST4axeSkEYty53qYplZ2jzlY5sEONbgm/P+
	 ZsqfShJRTduJxO1L+1jQyjZsQMEH8p37cR0cC9gv/UoqsrVR8f95Ds7jvnOlsZABgSlFc
	 AtpxzqoKPHUJ8gzNarpfSD6XDmU21A+gMuec8vth05UFf/v/VSazVJz1nnxCBWj9h0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sly4z5uG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277D606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sly4z5uG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0D01F000C7;
	Thu, 19 Nov 2026 19:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118250;
	bh=VbD77C66nYCHFlbT6QlAxVkfxaAFAodZP7Phn6s+1sg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Sly4z5uGv4rfryGSpmkATKAjxw32LoWrkaR48f1mjFx+KHD5Q1tnqRn8cM1wf6BEh
	 msDn6mCgdnSnexAtJZB30o9OCI12VIr5lfpN9BWQaCmsuQG5/6PnTvWokvcpg+DSGP
	 67GeQOZHBSYaitoQdiRaQ+4P8nTvVYq1kngMGNReSDq/REfGdDDBPZLzPAwPACrfsE
	 pWEmRGVGk+98GS2AfafkKObNnRWUfAXcWpn6qYkZ3Y/PrIgm0Va+W8OUdlHBrSm00V
	 M3Hj7GCAuYvauVknlIgYxZalRXHTO/CBtrfWcWLb5i/H4exyb6pgAgln1cc+NWYX+E
	 OmVHfj3Lrg2Hg==
Message-ID: <sashiko-outbox-223994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] mfd: twl-core: Clear twl_priv pointer on
 teardown and probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261119194939.2436337-2-lee@kernel.org>
References: <20261119194939.2436337-1-lee@kernel.org>
 <20261119194939.2436337-2-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:57:30 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> twl_probe() allocates the file-scope twl_priv state with devm_kzalloc()
> and checks for a non-NULL twl_priv at entry to reject multiple device
> instances.  However, twl_remove() and the early error paths in
> twl_probe() never reset twl_priv to NULL, a failure when adding MFD
> child devices bypasses twl_remove() by jumping to out instead of fail,
> and twl_remove() tears down the IRQ domain and dummy I2C clients before
> child devices are unregistered.  After devres frees the underlying
> memory on probe failure or unbind, twl_priv remains a dangling pointer,
> causing subsequent exported API calls to dereference freed memory and
> blocking future probe attempts with -EBUSY.
>=20
> Unregister DT-populated and MFD child devices at the start of
> twl_remove(), ensure mfd_add_devices() failures unwind via fail, and
> reset twl_priv to NULL in twl_remove() and on probe error exit.
>=20
> Fixes: 80a97ccd33be ("mfd: twl-core: Collect global variables behind one =
private structure (global)")
> Closes: https://sashiko.dev/#/bug/linux-73e82f84-94de-4d08-82a4-f22d42a1d=
edf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119194939.2436=
337-1-lee@kernel.org?part=3D1


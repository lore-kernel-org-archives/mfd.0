Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909485;
	b=Nw6F3sZ9tFiSaAHqpLV56/CmWK37S2ZAQf2y5WGmBVDMgxf8KGjjbuq7JE2pMLpqv+z5
	 INUae2aHKRp5uuk8BMjYWdOnNen403vrQAlKIULjdTadPKl+9T5hkOAbQZRMbA6KVcWdW
	 iOE50PJN118E/fn3MipJhyPGF24uS2C9FTHHYHYnU6gsITpZRi926GdNuPRXLOH6AG5R+
	 RyOpvH/hbj58zqzS61ckbRfEhQ1f+xLC11CQjXg2tDyMe65ttinnPr5NIVUd4zc4iQAAW
	 axc/B5bD1zwR9bS9OMMIOD3RIu51+waFqURBoSFc6V/hVrrk3aK+ElUPj4AHUBo1O3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rB0he+AGSs3aANJ8Uu5SXDc77J+uhV+tJRzDDa4NWZ0=;
	b=f8FufGLe97nP5RyMGTkq9BUzobi+11pmVfYf3hujv8troqUHY17Nz4zIoldppIjC9pM0
	 U4uREJLQusPZbWLTT+BCXRq90BJkEN0vsMhmHg5XZ9iuQ7TN0dyxcHmNnWXMN4pq4XvUo
	 bKWHN9QyU4uHRCWcDtypyR7wsKNOKM2osm38psm6qNMdPhUgUXAwXqbCk7NMkOGvVi6sq
	 J4YVrNK8MDfHFZqmImxzBNnpuPS5x3Wl3gFFIJ96/V5rcv6hzYVMi3xoyq7Nh4rYuJ+Q+
	 snDsq+QC/mSPw1+JSBdLe8phKvtBKA1vlnU9R00VWMP6cj+lmFaS2mQ+onAPAgNQsXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YhjBUzf/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA58606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhjBUzf/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101AC1F000C6;
	Tue, 17 Nov 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909485;
	bh=rB0he+AGSs3aANJ8Uu5SXDc77J+uhV+tJRzDDa4NWZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhjBUzf/nydvzw+ahZ0QM6rgYWbQOW7xdAlu7QWihfoPVKnKYOgWd/xZACaEha2+X
	 oH2NxTKPzFj+FNjJ0AW0HnoLIOKI98QrWwOHwk20DqoefIIZKWA/D2GycfgAsK4fSt
	 F/KjHDQUui2ysT9B4kWI94BSG1cbFf9DrXbHYiRLsNxDeRDQPUCRbx8v7Li2Roqhlz
	 YOhM/KBa/H1uTn3mKR2cFfjyUM9voVFAcV26BU19CZq8b3K9z8S1zBZbgVZuA3IhG4
	 JMFtmtri2qAHN5PUn2Ko/qW1GkNGcVy/uXFmyDByUMBu+g2wWV1MyCkDT8w3CiFRaa
	 bYfHh5USFG6cA==
Message-ID: <sashiko-outbox-218554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/10] i2c: cgbc: Propagate hardware errors when
 polling read status
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-2-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-2-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:58:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Lee Jones <lee@kernel.org>
>=20
> In cgbc_i2c_xfer_msg(), read_poll_timeout() uses the same ret variable
> to store the polled return value of cgbc_i2c_get_status() and the
> timeout result of the macro itself.  When cgbc_i2c_get_status() returns
> a negative error code (such as -EIO on an I2C NACK), the loop condition
> ret !=3D CGBC_I2C_STAT_BUSY evaluates to true and read_poll_timeout()
> overwrites ret with 0.  The driver then issues CGBC_I2C_CMD_DATA, which
> completes with CGBC_STATUS_CMD_READY without populating msg->buf,
> leaving uninitialised heap memory in the caller's read buffer.
>=20
> Store the polled status in a separate variable, verify that it equals
> CGBC_I2C_STAT_DAT, and check that CGBC_I2C_CMD_DATA returns the expected
> number of bytes.
>=20
> Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
> Closes: https://sashiko.dev/#/bug/linux-66cbf4b1-a219-4012-969d-236417bf4=
19a
> Cc: stable@vger.kernel.org
> Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> Tested-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> Signed-off-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D2


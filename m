Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513436195C
	for <mfd@lists.linux.dev>; Sun,  2 Aug 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679528; cv=none; b=mcYeeKvzLWMJ2VaBpIax0j4MmS9mVc5IDG0w/1LE/h9S8TiA6mVDheHeNr71+WNqVjDcSzkUWBGgXTEK4VKPl0kqb5iz/+Imw6Bxlk9tzws8vSSY0zoPIIRaHSzVDmkB1Nje2h3X5gKtCPmrj7MqOWfnho0C23mU1XQ7KuCbokc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679528; c=relaxed/simple;
	bh=9/Rs5u38yVdcywd3I/A2NIxS31KFTHHhT7GpwpOyc7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bc78ays8so0lOQ6rUCVPgY+gojPeKRVGAPKeyMVJf4MCzIrBQdKN3F6hSt05C35P5J/sFxHrklfAR62a9M3tOhhJVHkH61DTl43meB/oTGe4qXotL1FPCmPsSO3ucbp3YnETFf3qS/z2j7CKsu4I1lbT3fQG0ddl1DXTnASZhdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1y3+W0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1y3+W0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCBB1F000E9;
	Sun,  2 Aug 2026 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785679527;
	bh=8Uz1ZkVtu5guH/nmXrz/F9RlhOgqGS4H3LMx+EchrPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1y3+W0BJDM3W/sPVYZypSApYhq9eRFNDwUtalNI4kEitCt/+Izynvyx2edd7tC+z
	 xBMq8BYEwEHWw4OpjhXVYjgF+yr5ds0JXht8heZIRGhE6n6YP4XuqQHrWUX9rGtOZh
	 dzTHpaBZ1K821jO/Qwcj3whm6DiFuCpPxVC0qiW19zpk1sIg1nIQCQMVZnMyjnrsDr
	 Awyvo7Z9kmVIvZV5m7BNUyPzgHKGlbU+lXzVMxX9RG2fGOcUFl5LmqWj0m2ZQLzi/A
	 j3Ial4rqH0TifB+o2Dv+ZWVPOjAjFvXZgYnr3jO1Cug9sdCrSsgye+RAwiusCPcX1H
	 WamwzJCDFEauQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: qnap-mcu: keep the reply buffer alive past a
 command timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260802135307.31380-1-ali@iusegentoo.com>
References: <20260802135307.31380-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:05:25 +0000
Message-Id: <20260802140527.1FCBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem formatting rules.

Pre-existing issues:
- [Critical] A data race between `qnap_mcu_exec()` and `qnap_mcu_receive_bu=
f()` on `reply->length` and `reply->received` bypasses the loop exit condit=
ion, leading to a severe heap buffer overflow.
- [High] Late UART replies from timed-out or failed commands can be written=
 into the active buffer of the next command, causing data cross-talk and sp=
urious early completion.
- [High] A data race can cause `qnap_mcu_verify_checksum()` to be called wi=
th `reply->received =3D=3D 0`, leading to an integer underflow and a determ=
inistic kernel panic.
--

--- Patch [1]: [PATCH v2] mfd: qnap-mcu: keep the reply buffer alive past a=
 command timeout ---
commit 876c0f2fd3f8e4b677ad50b82d00f3dcfe4a3283
Author: Ali Ahmet Memis <ali@iusegentoo.com>

mfd: qnap-mcu: keep the reply buffer alive past a command timeout

This patch moves the receive buffer from the stack in qnap_mcu_exec() to
the qnap_mcu structure. This prevents stack corruption when late replies
arrive after a command has timed out.

Link: https://lore.kernel.org/all/20260802132012.537B81F000E9@smtp.kernel.o=
rg/

> mfd: qnap-mcu: keep the reply buffer alive past a command timeout

[Severity: Low]
Is there a capitalization typo in the subject line? Should "keep" be "Keep"?

> diff --git a/drivers/mfd/qnap-mcu.c b/drivers/mfd/qnap-mcu.c
> index 8de974ddac3e7..93a3dd93404dd 100644
> --- a/drivers/mfd/qnap-mcu.c
> +++ b/drivers/mfd/qnap-mcu.c

[ ... ]

> @@ -214,19 +216,18 @@ int qnap_mcu_exec(struct qnap_mcu *mcu,
>  		  const u8 *cmd_data, size_t cmd_data_size,
>  		  u8 *reply_data, size_t reply_data_size)
>  {
> -	unsigned char rx[QNAP_MCU_RX_BUFFER_SIZE];
>  	size_t length =3D reply_data_size + QNAP_MCU_CHECKSUM_SIZE;
>  	struct qnap_mcu_reply *reply =3D &mcu->reply;
>  	int ret =3D 0;
> =20
> -	if (length > sizeof(rx)) {
> +	if (length > sizeof(mcu->rx)) {
>  		dev_err(&mcu->serdev->dev, "expected data too big for receive buffer");
>  		return -EINVAL;
>  	}
> =20
>  	guard(mutex)(&mcu->bus_lock);
> =20
> -	reply->data =3D rx;
> +	reply->data =3D mcu->rx;
>  	reply->length =3D length;
>  	reply->received =3D 0;

[Severity: Critical]
This is a pre-existing issue, but can this reset race with an active receive
loop and cause a heap buffer overflow?

If the receive thread is running in qnap_mcu_receive_buf() and we reset
reply->received to 0 here without synchronization, the exact equality check
in the receive thread could be bypassed:

drivers/mfd/qnap-mcu.c:qnap_mcu_receive_buf()
	reply->received++;
	if (reply->received =3D=3D reply->length) {
		...

If the equality check is bypassed, the receive loop could write unbounded
bytes into reply->data (which now points to mcu->rx on the heap), causing
a heap buffer overflow.

>  	reinit_completion(&reply->done);

[Severity: High]
This isn't a bug introduced by this patch, but can resetting the completion
here allow late replies to corrupt the new command?

If a previous command times out, its receive thread is still active.

If we just reset the completion and start a new command, could a concurrent=
ly
arriving late response from the previous command be written into mcu->rx by
qnap_mcu_receive_buf()?

Since the old response is well-formed, it could pass the simple XOR checksu=
m,
triggering a spurious complete() and causing the new command to instantly
return with stale data.

> =20
>  	ret =3D qnap_mcu_write(mcu, cmd_data, cmd_data_size);
>  	if (ret < 0)
>  		return ret;
> =20
>  	serdev_device_wait_until_sent(mcu->serdev, msecs_to_jiffies(QNAP_MCU_TI=
MEOUT_MS));
> =20
>  	if (!wait_for_completion_timeout(&reply->done, msecs_to_jiffies(QNAP_MC=
U_TIMEOUT_MS))) {
>  		dev_err(&mcu->serdev->dev, "Command timeout\n");
>  		return -ETIMEDOUT;
>  	}
> =20
> -	if (!qnap_mcu_verify_checksum(rx, reply->received)) {
> +	if (!qnap_mcu_verify_checksum(mcu->rx, reply->received)) {

[Severity: High]
This is a pre-existing issue, but could this cause an integer underflow and=
 a
kernel panic if reply->received is 0?

If qnap_mcu_receive_buf() evaluates reply->received =3D=3D reply->length and
zeroes reply->length, but is preempted before calling complete(), the
original command can time out.=20

A new command could then call qnap_mcu_exec(), setting reply->received to 0.

If the preempted receive thread then resumes and calls complete(), the new
command will wake up and call qnap_mcu_verify_checksum() with
reply->received =3D=3D 0:

drivers/mfd/qnap-mcu.c:qnap_mcu_verify_checksum()
	u8 crc =3D qnap_mcu_csum(buf, size - QNAP_MCU_CHECKSUM_SIZE);

If size is 0, this underflows to the maximum size value, and qnap_mcu_csum()
will loop reading sequentially out of bounds until it hits an unmapped page.

>  		dev_err(&mcu->serdev->dev, "Invalid Checksum received from controller\=
n");
>  		return -EPROTO;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802135307.3138=
0-1-ali@iusegentoo.com?part=3D1

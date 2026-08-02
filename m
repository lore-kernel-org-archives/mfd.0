Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0DCFC0A
	for <mfd@lists.linux.dev>; Sun,  2 Aug 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676814; cv=none; b=YyEdSKpcSGdiuOQIHAwsLrzdHr73jmFSQipYKeBHkQ34LBPnmENbLwYtkp/UwuLQMbEyEMu0Kq5W0hhs6NSpHgWKwnpRHMjzVNf+O1JbPds/8u05NKbAZIDj3N9TtLr3AVnwKiu5KtG6/KXZJ0e/EobmryGGCo3lKKROTnqmNrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676814; c=relaxed/simple;
	bh=LZbU+uOYAxtSFaI1SuXgs3q1ptKY7mXb+pIowRWLKkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ows8VfLfT1ZGyDkYxp9o+5JgFqGMmc1ad9FM8+Wg0t9hNHmc4vEyA8PJinhztuhnucbDxgXPGjg9wcTB2Tw99pSUFmvf/eWGPfP8GVuVVHxYCTOYRelAwdvAfxqyyPSPeYal/B7yoLSHkxZ129Jh5QszutdYh0CB7+v5oLvGffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bX+697Ev; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bX+697Ev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537B81F000E9;
	Sun,  2 Aug 2026 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785676812;
	bh=Y+6FZ7GsOCol9pVbPPY2cJYoIVIHn7hWowrIIG3J4eI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bX+697Ev7xLlG4Z98EnhPESTxbA+hz1O3h2+tN6TyjxlUe6m4EIhMaNXsRggcElAz
	 VkYprh5SYGSffhFk/fCKZSftAB0Adt6SUNyMAan4dxwuB8Kyv4+zd3KQoS+Xp3vGW6
	 paOFw0xO9mmd7RjJ/nlwlbPG0agXXPhHK92IJQQGS4nedDwgJzaysDPkx+87EyW/tH
	 o5qzjXf3CVJy7DxCFu8rctAgUC1VqAryB2Y8RsU0hyE6/PXLsKw+vXgmV2W6LzjPiR
	 ajXh2+LwLtRndq/q4G2mGFKU5Xzhu1w0cYXsCECGrPl3HE0Qa1wnfNxnj+qFJrenZJ
	 NYWot3b7eJiSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: qnap-mcu: clear the reply state when a command
 times out
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260802130701.25702-1-ali@iusegentoo.com>
References: <20260802130701.25702-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 13:20:11 +0000
Message-Id: <20260802132012.537B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Lockless clearance of `reply->length` and `reply->data` on the=
 timeout path introduces a TOCTOU race leading to a NULL pointer dereferenc=
e or unbounded stack overflow.
- [Low] The commit message description is not capitalized.

Pre-existing issues:
- [High] Unhandled error path from `qnap_mcu_write` fails to clear the repl=
y state, leaving a stale pointer to a destroyed stack frame.
- [High] Dynamic modification of a non-const global `mfd_cell` array during=
 driver probe violates MFD subsystem rules and introduces a data race.
- [High] Lockless design of `qnap_mcu_receive_buf()` causes data races agai=
nst `qnap_mcu_exec()` initialization, leading to cross-command state corrup=
tion on unhandled timeouts.
- [High] Passing complex structure pointers directly through the `.data` fi=
eld in the `of_device_id` match table violates MFD subsystem guidelines.
--

--- Patch [1]: [PATCH] mfd: qnap-mcu: clear the reply state when a command =
times out ---
commit 89b6394df945cf63d91370772916c2e3c424866f
Author: Ali Ahmet Memis <ali@iusegentoo.com>
mfd: qnap-mcu: clear the reply state when a command times out

This commit modifies the timeout path in qnap_mcu_exec() to clear the reply
length and pointer. The goal is to prevent a late asynchronous reply from
being written into a destroyed on-stack buffer.

> mfd: qnap-mcu: clear the reply state when a command times out

[Severity: Low]
This isn't a bug introduced by this patch, but the MFD subsystem guidelines
require capitalizing the description after the subsystem prefix. Could we
update the subject to "mfd: qnap-mcu: Clear the reply state..."?

> diff --git a/drivers/mfd/qnap-mcu.c b/drivers/mfd/qnap-mcu.c
> index 8de974ddac3e7..f810cb4ff2ab7 100644
> --- a/drivers/mfd/qnap-mcu.c
> +++ b/drivers/mfd/qnap-mcu.c
> @@ -239,6 +239,8 @@ int qnap_mcu_exec(struct qnap_mcu *mcu,
> =20
>  	if (!wait_for_completion_timeout(&reply->done, msecs_to_jiffies(QNAP_MC=
U_TIMEOUT_MS))) {
>  		dev_err(&mcu->serdev->dev, "Command timeout\n");
> +		reply->length =3D 0;
> +		reply->data =3D NULL;

[Severity: Critical]
Does clearing these fields locklessly introduce a race condition with the
asynchronous receive callback?

If qnap_mcu_receive_buf() is actively executing:

qnap_mcu_receive_buf()
    if (!reply->length)
        return size;

    while (src < end) {
        reply->data[reply->received] =3D *src++;
        ...
        if (reply->received =3D=3D reply->length)
            ...

If the compiler reloads reply->data after it is set to NULL, couldn't this
cause a NULL pointer dereference?

Additionally, if it caches reply->data but reloads reply->length as 0, the
termination condition reply->received =3D=3D reply->length becomes impossib=
le to
satisfy. Could this cause the loop to blindly copy incoming bytes and create
an unbounded stack overflow?

>  		return -ETIMEDOUT;
>  	}

[Severity: High]
This is a pre-existing issue, but the error path for qnap_mcu_write() in
qnap_mcu_exec() appears to leave a stale pointer:

qnap_mcu_exec() {
    ...
    reply->data =3D rx;
    reply->length =3D length;
    ...
    ret =3D qnap_mcu_write(mcu, cmd_data, cmd_data_size);
    if (ret < 0)
        return ret;

If qnap_mcu_write() fails, we return without clearing reply->length and
reply->data. Could an asynchronous UART receive callback write into the
destroyed stack frame here?


[Severity: High]
This is a pre-existing issue, but does the lockless design of
qnap_mcu_receive_buf() allow cross-command state corruption?

In qnap_mcu_exec(), we initialize the reply locklessly:

qnap_mcu_exec() {
    ...
    reply->data =3D rx;
    reply->length =3D length;
    reply->received =3D 0;
    ...

If a previous command timed out and a late reply arrives while these fields
are being initialized for the next command, could the late reply bytes
corrupt the new command's buffer or incorrectly trigger its completion?


[Severity: High]
This is a pre-existing issue, but does qnap_mcu_probe() dynamically modify a
shared global mfd_cell array?

Looking at qnap_mcu_cells:

static struct mfd_cell qnap_mcu_cells[] =3D {
    ...
};

qnap_mcu_probe() {
    ...
    qnap_mcu_cells[i].platform_data =3D mcu->variant;
    qnap_mcu_cells[i].pdata_size =3D sizeof(*mcu->variant);
}

MFD subsystem rules require mfd_cell arrays to be static and constant. If
two QNAP MCU devices are probed concurrently, could they mutate this shared
global array simultaneously and cause a data race?


[Severity: High]
This is a pre-existing issue, but is it safe to pass complex structure
pointers through the match table data field?

qnap_mcu_dt_ids[] =3D {
    { .compatible =3D "qnap,ts133-mcu", .data =3D &qnap_ts133_mcu },
    ...
};

The MFD subsystem guidelines state that passing complex pointers through
match data tables can cause memory safety hazards and initialization races.
The guidelines mandate using an enum or integer ID instead. Should this be
updated to select the static struct in the probe function?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802130701.2570=
2-1-ali@iusegentoo.com?part=3D1

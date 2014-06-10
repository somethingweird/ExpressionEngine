<?php extend_template('default-nav') ?>

<?=form_open(cp_url('logs/cp'), 'class="tbl-ctrls"')?>
	<?php $this->view('_shared/form_messages')?>
	<fieldset class="tbl-search right">
		<input placeholder="<?=lang('type_phrase')?>" type="text" name="filter_by_phrase" value="<?=$filter_by_phrase_value?>">
		<input class="btn submit" type="submit" value="<?=lang('search_logs_button')?>">
	</fieldset>
	<h1><?php echo isset($cp_heading) ? $cp_heading : $cp_page_title?></h1>
	<?php $this->view('_shared/form_messages')?>
	<section class="item-wrap log">
		<?php if (empty($rows)): ?>
			<?=$no_results?>
		<?php else: ?>
			<?php foreach($rows as $row): ?>
			<div class="item">
				<ul class="toolbar">
					<li class="remove"><a href="<?=cp_url('logs/delete/developer/'.$row['log_id'])?>" title="remove"></a></li>
				</ul>
				<h3><?=lang('date_logged')?>:</b> <?=$row['timestamp']?></h3>
				<div class="message">
					<?=$row['description']?>
				</div>
			</div>
			<?php endforeach; ?>
		<?php endif; ?>

		<?php $this->view('_shared/pagination'); ?>

		<fieldset class="tbl-bulk-act">
			<a class="btn remove" href="<?=cp_url('logs/delete/developer')?>"><?=lang('clear_developer_logs')?></a>
		</fieldset>
	</section>
<?=form_close()?>
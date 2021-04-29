<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Queue;

/**
 * QueueSearch represents the model behind the search form of `app\models\Queue`.
 */
class QueueSearch extends Queue
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'uset_id', 'approve', 'confirm'], 'integer'],
            [['ref', 'queuedate', 'timesetup', 'dupdate'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Queue::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'uset_id' => $this->uset_id,
            'queuedate' => $this->queuedate,
            'timesetup' => $this->timesetup,
            'approve' => $this->approve,
            'confirm' => $this->confirm,
            'dupdate' => $this->dupdate,
        ]);

        $query->andFilterWhere(['like', 'ref', $this->ref]);

        return $dataProvider;
    }
}
